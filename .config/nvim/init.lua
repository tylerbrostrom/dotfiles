pcall(require, "impatient") -- Caches Lua modules for faster startup

if require "user.packer_was_just_downloaded"() then return end

vim.g.mapleader = " "

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"

local catppuccin = vim.F.npcall(require, "catppuccin")
if catppuccin then
	catppuccin.setup {}
	vim.g.catppuccin_flavour = "mocha"
	vim.api.nvim_command "colorscheme catppuccin"
end

require "user.telescope"
require "user.telescope.mappings"

require "user.lsp"

require "user.diagnostic"
require "user.dap"
