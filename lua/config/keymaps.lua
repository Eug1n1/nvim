vim.keymap.set(
    'i',
    'jk',
    '<Esc>',
    { noremap = true }
)

-- Navigate buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- smoka7/hop.nvim
local hop = require("hop")
local directions = require("hop.hint").HintDirection

vim.keymap.set(
    "n",
    "<leader>h",
    function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR })
    end,
    { remap = true }
)
vim.keymap.set(
    "n",
    "<leader>H",
    function()
        hop.hint_char1({ direction = directions.BEFORE_CURESOR })
    end,
    { remap = true }
)

-- echasnovski/mini.files
vim.keymap.set(
    "n",
    "tt",
    "<cmd>lua MiniFiles.open()<cr>",
    { noremap = true, silent = true }
)

-- nvim-neo-tree/neo-tree.nvim
vim.keymap.set(
    "n",
    "<leader>tf",
    ":Neotree filesystem toggle<cr>",
    { noremap = true, silent = true }
)
vim.keymap.set(
    "n",
    "<leader>tt",
    ":Neotree filesystem position=current toggle<cr>",
    { noremap = true, silent = true }
)

-- Navigating windows
vim.keymap.set(
    "n",
    "<C-h>",
    "<C-w>h",
    { noremap = true, silent = true }
)
vim.keymap.set(
    "n",
    "<C-j>",
    "<C-w>j",
    { noremap = true, silent = true }
)
vim.keymap.set(
    "n",
    "<C-k>",
    "<C-w>k",
    { noremap = true, silent = true }
)
vim.keymap.set(
    "n",
    "<C-l>",
    "<C-w>l",
    { noremap = true, silent = true }
)

-- yorickpeterse/nvim-window: neovim plugin to jump between windows
-- vim.keymap.set(
--     "n",
--     "<leader>wj",
--     ":lua require('nvim-window').pick()<CR>"
-- )

vim.keymap.set("n", "<S-l>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":vertical resize +2<CR>", { noremap = true, silent = true })

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
