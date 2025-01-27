vim.g.mapleader = " "

vim.keymap.set(
    'i',
    'jk',
    '<Esc>',
    { noremap = true }
)

-- LSP
vim.keymap.set(
    'n',
    '<leader>lf',
    vim.lsp.buf.format,
    { noremap = true }
)
vim.keymap.set(
    'n',
    '<leader>lr',
    vim.lsp.buf.rename,
    { noremap = true }
)
vim.keymap.set(
    'n',
    '<leader>lgd',
    vim.lsp.buf.definition,
    { noremap = true }
)
vim.keymap.set(
    'n',
    '<leader>lgt',
    vim.lsp.buf.type_definition,
    { noremap = true }
)
vim.keymap.set(
    'n',
    '<leader>lgi',
    vim.lsp.buf.implementation,
    { noremap = true }
)
vim.keymap.set(
    'n',
    '<leader>lgr',
    vim.lsp.buf.references,
    { noremap = true }
)

-- DIAGNOSTICS
vim.keymap.set(
    'n',
    '<leader>df',
    vim.diagnostic.open_float,
    { noremap = true, silent = true }
)
vim.keymap.set(
    'n',
    '<leader>dg[',
    vim.diagnostic.goto_prev,
    { noremap = true, silent = true }
)
vim.keymap.set(
    'n',
    '<leader>dg]',
    vim.diagnostic.goto_next,
    { noremap = true, silent = true }
)

-- vim.keymap.set(
--     'n',
--     '<leader>dd',
--     '<cmd>Telescope diagnostics<CR>',
--     { noremap = true, silent = true }
-- )

vim.keymap.set(
    'n',
    '<leader>dd',
    vim.diagnostic.setloclist,
    { noremap = true, silent = true }
)
