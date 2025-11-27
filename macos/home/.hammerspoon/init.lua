-- Hammerspoon Configuration
-- Path of Exile: Scroll Wheel → Keyboard Shortcuts

-- Configuration
local poeScrollConfig = {
    bundleID = "com.GGG.PathOfExile",
    scrollUp = {mods = {"ctrl"}, key = "r"},
    scrollDown = {mods = {"ctrl"}, key = "t"},
    enabled = true,
    -- Set to true to completely block scroll in PoE (prevents macOS Zoom)
    blockScroll = true
}

-- Create event tap for scroll wheel events
local scrollEventTap = nil

local function createScrollEventTap()
    if scrollEventTap then
        scrollEventTap:stop()
    end
    
    scrollEventTap = hs.eventtap.new({hs.eventtap.event.types.scrollWheel}, function(event)
        local success, result = pcall(function()
            if not poeScrollConfig.enabled then
                return false
            end
            
            local app = hs.application.frontmostApplication()
            if not app or app:bundleID() ~= poeScrollConfig.bundleID then
                return false
            end
            
            -- Get scroll delta (positive = up, negative = down)
            local delta = event:getProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1)
            
            -- Check if there's actual scrolling
            if delta ~= 0 then
                -- Send the keystroke directly (synchronous)
                if delta > 0 then
                    -- Scroll up → Ctrl+R
                    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
                    hs.eventtap.event.newKeyEvent("r", true):post()
                    hs.eventtap.event.newKeyEvent("r", false):post()
                    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
                else
                    -- Scroll down → Ctrl+T
                    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
                    hs.eventtap.event.newKeyEvent("t", true):post()
                    hs.eventtap.event.newKeyEvent("t", false):post()
                    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
                end
                
                -- Block the scroll event completely to prevent macOS Zoom
                if poeScrollConfig.blockScroll then
                    return true  -- Consume the event
                end
            end
            
            return false
        end)
        
        if not success then
            print("Scroll event error:", result)
            -- Restart the event tap after error
            hs.timer.doAfter(1, function()
                createScrollEventTap()
            end)
            return false
        end
        
        return result
    end)
    
    scrollEventTap:start()
    print("Scroll event tap started")
end

-- Start the event tap
createScrollEventTap()

-- Monitor and restart if it stops
hs.timer.doEvery(5, function()
    if scrollEventTap and not scrollEventTap:isEnabled() then
        print("Event tap stopped, restarting...")
        createScrollEventTap()
    end
end)

-- Show notification on startup
hs.notify.new({
    title = "Hammerspoon",
    informativeText = "Path of Exile scroll mappings active\nScroll Up → Ctrl+R\nScroll Down → Ctrl+T"
}):send()

-- Reload config on file change
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
    doAfter = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doAfter = true
        end
    end
    if doAfter then
        hs.reload()
    end
end):start()

hs.alert.show("Hammerspoon Config Loaded")
