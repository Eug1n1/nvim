local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- require('user.toggleterm').set_keymaps()

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- keymap("", "jj", "<Nop>", opts)
-- keymap("", "hh", "<Nop>", opts)
-- keymap("", "kk", "<Nop>", opts)
-- keymap("", "ll", "<Nop>", opts)

-- keymap("n", "<C-k>f", ":lua vim.lsp.buf.format {async = true}<cr>", opts)
-- Normal --
-- keymap("n", "mp", "<Plug>MarkdownPreviewToggle", opts)

keymap("n", "tt", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>l", '<cmd>lua require("lsp_lines").toggle()<cr>', opts)

keymap("n", "<C-1>", "<cmd>lua Terminals.float:toggle()<CR>", { noremap = true, silent = true })
keymap("n", "<C-2>", "<cmd>lua Terminals.horizontal:toggle()<CR>", { noremap = true, silent = true })
keymap("n", "<C-3>", "<cmd>lua Terminals.vertical:toggle()<CR>", { noremap = true, silent = true })
keymap("n", "<C-4>", "<cmd>lua Terminals.lazygit:toggle()<CR>", { noremap = true, silent = true })

-- Hop
keymap("n", "<leader>w", ":lua require'hop'.hint_words()<cr>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<S-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-h>", ":vertical resize +2<CR>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("n", "cic", "<Plug>kommentary_line_default", opts)
keymap("x", "ci", "<Plug>kommentary_visual_default", opts)
