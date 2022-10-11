vim.opt.guicursor = ""

-- Set cursorline, but only for the current buffer!
vim.opt.cursorline = true
local cursorline_augroup = vim.api.nvim_create_augroup("CursorlineControl", { clear = true })
local set_cursorline = function (event, value, pattern)
	vim.api.nvim_create_autocmd(event, {
		group = cursorline_augroup,
		pattern = pattern,
		callback = function ()
			vim.opt_local.cursorline = value
		end
	})
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
-- Makes for smoother UI. Default of 4000 ms is noticeably janky.
-- Since we're not writing to a swapfile, there's no harm in making it shorter.
vim.opt.updatetime = 300

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"

-- More space for displaying messages
vim.opt.cmdheight = 0
vim.opt.laststatus = 3

-- Popup menus
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.pumheight = 10
-- Mark column 80
vim.opt.colorcolumn = "80"
-- Hide info which was made redundant by Lualine plugin
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
-- Prevents jank
vim.opt.signcolumn = "yes"
-- Keep a margin between the window and the cursor
vim.opt.scrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true

--Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append "c"
-- Show tabs and spaces
vim.opt.list = true
vim.opt.listchars = {
	eol = '↲',
	tab = '» ',
	trail = '·',
	space = '·',
	extends = '…',
	precedes = '…',
	conceal = '┊',
	nbsp = '☠'
}

--vim.opt.whichwrap:append("<,>,[,],h,l")
--vim.opt.iskeyword:append("-")
