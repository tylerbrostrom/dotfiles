local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

require("refactoring").setup()

local builtins = null_ls.builtins
null_ls.setup {
  debug = false,
  sources = {
    builtins.code_actions.refactoring,
    builtins.diagnostics.checkmake,
    builtins.formatting.prettierd,
  },
}
