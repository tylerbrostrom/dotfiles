local options = {
    swapfile = false,                       -- buffers live in memory, not on disk (for security’s sake)

    -- Winders
    splitbelow = true,                      -- force all horizontal splits to go below current window
    splitright = true,                      -- force all vertical splits to go to the right of current window

    -- UI
    termguicolors = true,                   -- enable 24-bit RGB color
    cmdheight = 2,                          -- more space in the neovim command line for displaying messages
    number = true,
    numberwidth = 6,
    relativenumber = true,
    signcolumn = "yes",                     -- always show the sign column, otherwise it would shift the text each time
    cursorline = true,

    -- Indent
    autoindent = true,
    smartindent = true,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    -- Search
    smartcase = true,
    ignorecase = true,

    -- Viewport 
    wrap = false,
    scrolloff = 8,                          -- number of screen lines to keep above and below the cursor
    sidescrolloff= 8,                       -- number of screen lines to keep to the right and left of the cursor
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
