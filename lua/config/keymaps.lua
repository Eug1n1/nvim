vim.g.mapleader = " "

vim.api.nvim_set_keymap(
    'i',
    'jk',
    '<Esc>',
    { noremap = true }
)

-- FORMATTING
vim.api.nvim_set_keymap(
    'n',
    '<leader>ff',
    ':lua vim.lsp.buf.format()<CR>', { noremap = true }
)

-- DIAGNOSTICS
vim.api.nvim_set_keymap(
    'n',
    '<leader>do',
    '<cmd>lua vim.diagnostic.open_float()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>d[',
    '<cmd>lua vim.diagnostic.goto_prev()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>d]',
    '<cmd>lua vim.diagnostic.goto_next()<CR>',
    { noremap = true, silent = true }
)

-- vim.api.nvim_set_keymap(
--     'n',
--     '<leader>dd',
--     '<cmd>Telescope diagnostics<CR>',
--     { noremap = true, silent = true }
-- )

vim.api.nvim_set_keymap(
    'n',
    '<leader>dd',
    '<cmd>lua vim.diagnostic.setloclist()<CR>',
    { noremap = true, silent = true }
)

