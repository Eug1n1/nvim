vim.pack.add({
    { src = 'https://github.com/vague2k/vague.nvim' },
    { src = 'https://github.com/Mofiqul/vscode.nvim' },

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

    { src = 'https://github.com/sainnhe/gruvbox-material' },
})

local plugins = {
    treesitter = {
        name = "nvim-treesitter.configs",
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        setup = {
            ensure_installed = {
                "c",
                "go",
                "lua",
                "markdown",
                "markdown_inline",
            },
            sync_install = true,
        }
    },
    miniSurround = {
        name = "mini.surround",
        src = 'https://github.com/nvim-mini/mini.surround',
    },
    miniPairs = {
        name = "mini.pairs",
        src = 'https://github.com/nvim-mini/mini.pairs',
    },
    miniPick = {
        name = "mini.pick",
        src = 'https://github.com/nvim-mini/mini.pick',
    },
    miniComment = {
        name = "mini.comment",
        src = 'https://github.com/nvim-mini/mini.comment',
        setup = {
            options = {
                ignore_blank_line = true,
            },
        },
    },
    miniDiff = {
        name = "mini.diff",
        src = 'https://github.com/nvim-mini/mini.diff',
    },
    lualine = {
        src = 'https://github.com/nvim-lualine/lualine.nvim',
    },
    mason = {
        src = 'https://github.com/mason-org/mason.nvim',
    },
    oil = {
        src = 'https://github.com/stevearc/oil.nvim',
        setup = {
            columns = {
                "icon",
                "size",
                "mtime",
            },
            win_options = {
                cursorcolumn = true,
            },
            delete_to_trash = true,
            keymaps = {
                ["g?"] = { "actions.show_help", mode = "n" },
                ["l"] = "actions.select",
                ["h"] = { "actions.parent", mode = "n" },
            },
        }
    },
    lspConfig = {
        src = 'https://github.com/neovim/nvim-lspconfig',
    }
}

local pluginsToInstall = {}
for _, value in pairs(plugins) do
    table.insert(pluginsToInstall, { src = value.src })
end
vim.pack.add(pluginsToInstall)

for key, value in pairs(plugins) do
    local pluginName = key
    if value.name then
        pluginName = value.name
    end

    local status_ok, plugin = pcall(require, pluginName)
    if not status_ok then
        print(key .. " not found")
        return
    end

    if plugin.setup then
        plugin.setup(value.setup)
    else
        plugin.setup()
    end
end


