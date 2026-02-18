vim.lsp.enable({
    "lua_ls",
    "ansiblels",
    "helm_ls",
    "gitlab_ci_ls",
    "rust_analyzer",
    "gopls",
    "yamlls",
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})
