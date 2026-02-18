local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("nvim-treesitter not found")
    return
end

nvim_treesitter.setup({
    ensure_installed = {
        "c",
        "go",
        "lua",
        "markdown",
        "markdown_inline",
        "helm",
        "gotmpl",
    },
    sync_install = true,
    auto_install = false,
    modules = {},
    ignore_install = {},
})
