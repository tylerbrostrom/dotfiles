local packer = require "packer"
_ = vim.cmd [[packadd packer.nvim]]

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function() return require("packer.util").float { border = "rounded" } end,
	},
}

return packer.startup(function(use)
	use {
		"wbthomason/packer.nvim", -- Package manager
		"lewis6991/impatient.nvim", -- Speeds up Neovim startup time
		"gpanders/editorconfig.nvim", -- Reads and applies .editorconfig
		"windwp/nvim-autopairs", -- Autopairs (brackets, quotes, etc.)
		"moll/vim-bbye", -- Delete buffers without closing windows
		"ahmedkhalf/project.nvim", -- Automatically change into project dirs
		"goolord/alpha-nvim", -- UI for editor startup
		"edluffy/hologram.nvim", -- Image viewer (compatible w/ Kitty terminal)
	}

	-- File explorer
	use {
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}

	-- Status line
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}

	-- Buffer navigation
	use { "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" }

	-- UI to select things (files, grep results, open buffers, etc.)
	use {
		{ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	}

	-- Git
	use {
		-- Add git decorations in the signs columns
		{ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" },
		-- GitHub permalinks for code sharing
		{ "ruifm/gitlinker.nvim", requires = "nvim-lua/plenary.nvim" },
		-- Edit GitHub PRs and issues
		{
			"pwntester/octo.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
				"kyazdani42/nvim-web-devicons",
			},
		},
	}

	-- Bindings for tree-sitter, a fast incremental parsing library
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

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
		"JoosepAlviste/nvim-ts-context-commentstring", -- Sets commentstring option based on cursor position
	}

	-- Language Server Protocol (LSP)
	use {
		-- Provide LSP configs
		"neovim/nvim-lspconfig",
		-- Hook arbitrary sources into LSP
		"jose-elias-alvarez/null-ls.nvim",
		-- Provide code actions for refactoring
		{
			"ThePrimeagen/refactoring.nvim",
			requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		},
	}

	-- Debugger Adapter Protocol (DAP)
	use {
		"mfussenegger/nvim-dap", -- Debug Adapter Protocol (DAP) client
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
	}

	-- Install and configure LSP, DAP, and other tools
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim", -- Shims together mason and nvim-lspconfig
		"jayp0521/mason-null-ls.nvim", -- Shims together mason and null-ls
		"jayp0521/mason-nvim-dap.nvim", -- Shims together mason and dap
	}
end)
