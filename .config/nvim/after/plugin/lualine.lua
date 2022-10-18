local lualine = vim.F.npcall(require, "lualine")
if not lualine then return end

lualine.setup {
	options = {
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
}
