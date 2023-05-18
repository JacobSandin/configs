local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local form = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics
local comp = null_ls.builtins.completion
local code = null_ls.builtins.code_actions

require("null-ls").setup({
  sources = {
    form.stylua.with({ extra_args = { "--indent-type=Spaces", "--indent-width=2" } }),
    diag.flake8, --python
    form.black, --python
    comp.spell,
    diag.php,
    form.phpcsfixer,
    form.perltidy,
    form.shfmt.with({ extra_args = { "-i", "2" } }),
    code.gitsigns,
    diag.ansiblelint, -- ansible npm install -g @ansible/ansible-language-server
    form.prettier, -- yaml etc npm install --save-dev --save-exact prettier
  },
})

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format {async = true}' ]])