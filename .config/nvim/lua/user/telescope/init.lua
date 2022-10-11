local telescope = vim.F.npcall(require, "telescope")
if not telescope then return end

telescope.setup {
	defaults = {
		file_ignore_patterns = { ".git/", "node_modules" },
		layout_config = {
			prompt_position = "top",
		},
	},
}

telescope.load_extension "fzf"
telescope.load_extension "projects"
telescope.load_extension "octo"
