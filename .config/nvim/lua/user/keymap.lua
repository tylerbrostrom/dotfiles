local M = {}

local bind = function(mode, remap)
	---@param lhs string
	---@param rhs string|function
	---@param opts? table
	---@see |vim.keymap.set()|
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", opts or {}, { remap = remap }) -- enforce remap option
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

M.nmap = bind("n", true)
M.nnoremap = bind("n", false)
M.vnoremap = bind("v", false)
M.xnoremap = bind("x", false)
M.inoremap = bind("i", false)

return M
