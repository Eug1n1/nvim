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

    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/j-morano/buffer_manager.nvim' },

    { src = 'https://github.com/saghen/blink.cmp' },
    { src = 'https://github.com/L3MON4D3/LuaSnip' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
})

-- empty setup for plugins that don't need any configuration
require("mini.pick").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.diff").setup()
require("sops").setup({})
require("buffer_manager").setup()
require("mason").setup()
require("luasnip.loaders.from_vscode").lazy_load()

-- plugins that need to be configured
require("plugins.mini-comment")
require("plugins.oil")
require("plugins.treesitter")
require("plugins.blink")
