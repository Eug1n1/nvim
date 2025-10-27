local status_ok, mini_comment = pcall(require, "mini.comment")
if not status_ok then
    vim.notify("mini.comment not found")
    return
end

mini_comment.setup({
    options = {
        ignore_blank_line = true,
    },
})

