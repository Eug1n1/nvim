vim.lsp.enable("lua_ls")
vim.lsp.enable("ansiblels")
vim.lsp.enable("helm_ls")
vim.lsp.enable("gitlab_ci_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable('gopls')

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})
