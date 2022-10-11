local project = vim.F.npcall(require, "project_nvim")
if not project then return end

project.setup {
	detection_methods = { "pattern" },
	patterns = { ".git", "Makefile", "package.json" },
	silent_chdir = false,
}
