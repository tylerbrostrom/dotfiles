local autopairs = vim.F.npcall(require, "nvim-autopairs")
if not autopairs then return end

autopairs.setup {
	check_ts = true, -- treesitter integration
	disable_filetype = { "TelescopePrompt" },
}

local cmp = vim.F.npcall(require, "cmp")
if not cmp then return end
cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
