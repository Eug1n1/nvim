vim.o.number = true


vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.breakindent = true

vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.o.colorcolumn = '90'

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- vim.o.clipboard = 'unnamedplus'

vim.o.wrap = false

vim.o.signcolumn = 'yes'

vim.o.undofile = true

vim.o.sidescrolloff = 20
vim.o.scrolloff = 12

vim.o.showmode = false
vim.o.swapfile = false
vim.o.winborder = 'rounded'

--# splitright = true
--# splitbelo = true

vim.g.mapleader = ' '

vim.pack.add({
    { src = 'https://github.com/vague2k/vague.nvim' },
    { src = 'https://github.com/Mofiqul/vscode.nvim' },
    { src = 'https://github.com/sainnhe/gruvbox-material' },

    { src = 'https://github.com/nvim-mini/mini.pick' },
    { src = 'https://github.com/nvim-mini/mini.surround' },
    { src = 'https://github.com/nvim-mini/mini.comment' },
    { src = 'https://github.com/nvim-mini/mini.pairs' },
    { src = 'https://github.com/nvim-mini/mini.diff' },

    { src = 'https://github.com/stevearc/oil.nvim' },

    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },

    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },

    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/trixnz/sops.nvim' },
})

require("mini.pick").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.diff").setup()
require("sops").setup()
require("oil").setup()
require("mason").setup()



vim.g.gruvbox_material_background = 'hard'
vim.cmd.colorscheme("vscode")

-- lsp
vim.lsp.enable({ "lua_ls" })
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client ~= nil and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end
})
vim.cmd("set completeopt+=noselect")

vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')

-- mini
vim.keymap.set('n', '<leader>p', ':Pick files<CR>')
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>')

-- oil
vim.keymap.set('n', '<leader>e', ':Oil --float<CR>')

-- lsp keymaps
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
