if not pcall(require, "telescope") then return end

local nnoremap = require("user.keymap").nnoremap

local opts = { silent = true }

nnoremap("<leader>ff", require("telescope.builtin").find_files, opts)
nnoremap("<leader>ft", require("telescope.builtin").live_grep, opts)
nnoremap("<leader>fp", require("telescope").extensions.projects.projects, opts)
nnoremap("<leader>fb", require("telescope.builtin").buffers, opts)
