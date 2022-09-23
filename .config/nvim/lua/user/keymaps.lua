local Keymap = require("user.keymap")
local nnoremap, inoremap, vnoremap, xnoremap = Keymap.nnoremap, Keymap.inoremap, Keymap.vnoremap, Keymap.xnoremap

-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

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
vnoremap("p", '"_dP', opts)

-- Press jk fast to enter
inoremap("jk", "<ESC>", opts)

-- Stay in indent mode
vnoremap("<", "<gv", opts)
vnoremap(">", ">gv", opts)

-- Plugins --

-- NvimTree
nnoremap("<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
nnoremap("<leader>ff", function () require'telescope.builtin'.find_files() end, opts)
nnoremap("<leader>ft", function () require'telescope.builtin'.live_grep() end, opts)
nnoremap("<leader>fp", function () require'telescope'.extensions.projects.projects() end, opts)
nnoremap("<leader>fb", function () require'telescope.builtin'.buffers() end, opts)

-- Comment
nnoremap("<leader>/", function () require'Comment.api'.toggle.linewise.current() end, opts)
xnoremap("<leader>/", function ()
	local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
	vim.api.nvim_feedkeys(esc, 'nx', false)
	require'Comment.api'.toggle.linewise(vim.fn.visualmode())
end, opts)

-- DAP
nnoremap("<leader>db", function () require'dap'.toggle_breakpoint() end, opts)
nnoremap("<leader>db", function () require'dap'.toggle_breakpoint() end, opts)
nnoremap("<leader>dc", function () require'dap'.continue() end, opts)
nnoremap("<leader>di", function () require'dap'.step_into() end, opts)
nnoremap("<leader>do", function () require'dap'.step_over() end, opts)
nnoremap("<leader>dO", function () require'dap'.step_out() end, opts)
nnoremap("<leader>dr", function () require'dap'.repl.toggle() end, opts)
nnoremap("<leader>dl", function () require'dap'.run_last() end, opts)
nnoremap("<leader>du", function () require'dapui'.toggle() end, opts)
nnoremap("<leader>dt", function () require'dap'.terminate() end, opts)
