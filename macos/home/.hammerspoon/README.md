# Hammerspoon Configuration

Hammerspoon är ett kraftfullt automationsverktyg för macOS som använder Lua-skripting.

## Path of Exile Scroll Wheel Mapping

Denna konfiguration mappar scroll wheel till tangentbordskommandon **endast i Path of Exile**:

- **Scroll Up** → **Ctrl+R**
- **Scroll Down** → **Ctrl+T**

## Installation

1. Hammerspoon installeras via Homebrew: `brew install --cask hammerspoon`
2. Kör `./install.sh` från macos-mappen för att skapa symlinks
3. Starta Hammerspoon från Applications
4. Ge Hammerspoon **Accessibility**-behörighet:
   - System Settings → Privacy & Security → Accessibility
   - Lägg till Hammerspoon

## Användning

- Hammerspoon startar automatiskt vid inloggning (kan konfigureras i appen)
- Ikon i menyraden visar att den körs
- När du startar Path of Exile får du en notifikation om att mappningarna är aktiva
- Scroll wheel fungerar normalt i alla andra appar

## Ändra Konfiguration

Redigera `init.lua` och ändra inställningarna i `poeScrollConfig`:

```lua
local poeScrollConfig = {
    bundleID = "com.GGG.PathOfExile",
    scrollUp = {mods = {"ctrl"}, key = "r"},    -- Ändra detta
    scrollDown = {mods = {"ctrl"}, key = "t"},  -- Ändra detta
    enabled = true
}
```

Hammerspoon laddar automatiskt om konfigurationen när du sparar filer i `~/.hammerspoon/`.

## Felsökning

- **Fungerar inte?** Kontrollera att Accessibility-behörighet är aktiverad
- **Scroll wheel fungerar inte alls?** Kontrollera att Hammerspoon körs (ikon i menyraden)
- **Fel tangenter?** Kontrollera `scrollUp` och `scrollDown` i `init.lua`

## Kommandon

```bash
# Ladda om konfiguration
hs -c "hs.reload()"

# Öppna Hammerspoon console
hs -c "hs.openConsole()"
```
