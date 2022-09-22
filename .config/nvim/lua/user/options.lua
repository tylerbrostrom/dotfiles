vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

--[[ vim.opt.smarttab = false ]]
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.smartindent = true

vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

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

--[[ Cmp ]]
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.pumheight = 10

--[[ vim.opt.splitbelow = true ]]
--[[ vim.opt.splitright = true ]]


vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)

-- Default (4000 ms) is noticeably janky
vim.opt.updatetime = 300                        -- faster completion (4000ms default)


vim.opt.colorcolumn = "80"

-- Hide info which was made redundant by Lualine plugin
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false

vim.opt.signcolumn = "yes"

vim.opt.wrap = false

vim.opt.scrolloff = 8

vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars.eob=" "
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
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
