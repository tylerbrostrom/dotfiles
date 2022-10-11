if not pcall(require, "nvim-treesitter") then return end

require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"go",
		"html",
		"javascript",
		"json",
		"markdown",
		"rust",
		"toml",
		"tsx",
		"typescript",
	},
	ignore_install = { "" },

	autopairs = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = { lua = "--  %s" },
	},
	highlight = { enable = true, disable = { "css" } },
	indent = { enable = true, disable = { "python", "css" } },
}
