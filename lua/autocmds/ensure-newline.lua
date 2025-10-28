-- Ensure file ends with a newline on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        -- Save cursor position
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        -- Ensure file ends with newline
        local last_line = vim.fn.line("$")
        local last_line_content = vim.fn.getline(last_line)

        if last_line_content ~= "" then
            vim.fn.append(last_line, "")
        end

        -- Restore cursor position
        pcall(vim.api.nvim_win_set_cursor, 0, cursor_pos)
    end,
})

