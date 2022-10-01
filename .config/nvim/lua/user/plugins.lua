local packer_was_just_installed = (function ()
	local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
	if vim.fn.empty(vim.fn.glob(install_path)) == 0 then
		return false
	end
	vim.fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	vim.cmd [[packadd packer.nvim]]
	return true
end)()

local packer = require "packer"

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require "packer.util".float { border = "rounded" }
		end,
	},
}

return packer.startup(function(use)
	use {
		"wbthomason/packer.nvim", -- Package manager
		"lewis6991/impatient.nvim", -- Speeds up Neovim startup time
		"RRethy/vim-illuminate", -- Highlights words under the cursor
		"gpanders/editorconfig.nvim", -- Reads and applies .editorconfig
		"windwp/nvim-autopairs", -- Autopairs (brackets, quotes, etc.)
		"nvim-lualine/lualine.nvim", -- Status line
		"akinsho/bufferline.nvim", -- UI for showing open  buffers
		"moll/vim-bbye", -- Delete buffers without closing windows
		"ahmedkhalf/project.nvim", -- Automatically change into project dirs
		"goolord/alpha-nvim", -- UI for editor startup
	}

	-- UI to select things (files, grep results, open buffers, etc.)
	use {
		{"nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim"},
		{"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
	}

	-- File explorer
	use {
		"kyazdani42/nvim-tree.lua",
		"kyazdani42/nvim-web-devicons",
	}

	-- Add git decorations in the signs columns
	use {"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim"}

	-- Bindings for tree-sitter, a fast incremental parsing library
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

	-- Colorschemes
	use { "catppuccin/nvim", as = "catppuccin" }

	-- Completion
	use {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-path", -- Path completion
		"saadparwaiz1/cmp_luasnip", -- Snippet completion
		"hrsh7th/cmp-nvim-lsp", -- LSP completion
		"hrsh7th/cmp-nvim-lua", -- Lua completion
	}

	-- Snippets
	use {
		"L3MON4D3/LuaSnip", -- Snippet engine
		"rafamadriz/friendly-snippets",
	}

	-- Comments
	use {
		"numToStr/Comment.nvim",
		"JoosepAlviste/nvim-ts-context-commentstring",
	}

	-- Language Server Protocol
	use {
		"neovim/nvim-lspconfig", -- Provides LSP configs
		"williamboman/mason.nvim", -- Installs tool binaries (LSP, DAP, and otherwise)
		"williamboman/mason-lspconfig.nvim", -- Shims together mason and nvim-lspconfig
		"jose-elias-alvarez/null-ls.nvim", -- Interface for setting up arbitrary LSP sources
	}

	-- Provides code actions for refactoring
	use {
		"ThePrimeagen/refactoring.nvim",
		requires = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"}
	}

	-- Debugger
	use {
		"mfussenegger/nvim-dap", -- Debug Adapter Protocol (DAP) client
		"rcarriga/nvim-dap-ui",
	}

	if packer_was_just_installed then
		packer.sync()
	end
end)
