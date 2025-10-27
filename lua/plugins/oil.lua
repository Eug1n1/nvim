local status_ok, oil = pcall(require, "oil")
if not status_ok then
    vim.notify("oil.nvim not found")
    return
end

oil.setup({
    win_options = {
        cursorcolumn = true,
        signcolumn = "yes:2",
    },
    delete_to_trash = true,
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["l"] = "actions.select",
        ["h"] = { "actions.parent", mode = "n" },
    },
})

