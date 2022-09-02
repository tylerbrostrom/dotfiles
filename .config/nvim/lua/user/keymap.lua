local M = {}

local function bind(mode, recursive_opts)
  ---@param lhs string
  ---@param rhs string|function
  ---@param opts? table
  return function (lhs, rhs, opts)
    opts = vim.tbl_extend("keep",
      recursive_opts,
      opts or {}
    )
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local RECURSIVE = {remap = true, noremap = false}
local NOT_RECURSIVE = {remap = false, noremap = true}

M.nmap = bind("n", RECURSIVE)
M.nnoremap = bind("n", NOT_RECURSIVE)
M.vnoremap = bind("v", NOT_RECURSIVE)
M.xnoremap = bind("x", NOT_RECURSIVE)
M.inoremap = bind("i", NOT_RECURSIVE)

return M
