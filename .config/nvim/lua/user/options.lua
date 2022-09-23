vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

--[[ vim.opt.smarttab = false ]]
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
vim.opt.cmdheight = 1
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

vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars.eob=" "
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

--[[ vim.opt.whichwrap:append("<,>,[,],h,l") ]]
--[[ vim.opt.iskeyword:append("-") ]]
