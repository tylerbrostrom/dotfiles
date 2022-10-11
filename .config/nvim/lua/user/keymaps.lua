local nnoremap = require("user.keymap").nnoremap
local inoremap = require("user.keymap").inoremap
local vnoremap = require("user.keymap").vnoremap
local xnoremap = require("user.keymap").xnoremap

-- Silent keymap option
local opts = { silent = true }

nnoremap("<Up>", "<C-y>")
nnoremap("<Down>", "<C-e>")

-- Better window navigation
nnoremap("<C-h>", "<C-w>h", opts)
nnoremap("<C-j>", "<C-w>j", opts)
nnoremap("<C-k>", "<C-w>k", opts)
nnoremap("<C-l>", "<C-w>l", opts)

-- Resize with arrows
nnoremap("<C-Up>", ":resize -2<CR>", opts)
nnoremap("<C-Down>", ":resize +2<CR>", opts)
nnoremap("<C-Left>", ":vertical resize -2<CR>", opts)
nnoremap("<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
nnoremap("<S-l>", ":bnext<CR>", opts)
nnoremap("<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
nnoremap("<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
nnoremap("<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
xnoremap("<leader>p", '"_dP', opts)

-- Press jk fast to enter
inoremap("jk", "<ESC>", opts)

-- Stay in indent mode
vnoremap("<", "<gv", opts)
vnoremap(">", ">gv", opts)

-- NvimTree
nnoremap("<leader>e", ":NvimTreeToggle<CR>", opts)

