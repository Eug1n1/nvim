local options = {
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,

    autoindent = true,
    smartindent = true,
    smarttab = true,

    breakindent = true,

    cursorline = true,
    cursorcolumn = false,
    colorcolumn = '90',

    ignorecase = true,
    smartcase = true,
    hlsearch = true,

    number = true,

    clipboard = 'unnamedplus',

    wrap = false,

    signcolumn = 'yes',

    undofile = true,

    sidescrolloff = 8,
    scrolloff = 8,

    showmode = false,

    splitright = true,
    splitbelow = true,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
