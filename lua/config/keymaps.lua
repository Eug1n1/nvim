vim.keymap.set('n', '<leader>p', ':Pick grep_live<CR>')

vim.keymap.set('n', '<leader>e', ':Oil --float<CR>')

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })


--- Navigate buffers bypassing the menu
local bmui = require("buffer_manager.ui")

for i, key in ipairs(vim.split("1234567890", "")) do
    vim.keymap.set(
        "n",
        ("<leader>%s"):format(key),
        function()
            bmui.nav_file(i)
        end,
        { desc = ("Buffer %d"):format(i) }
    )
end

vim.keymap.set({ 'n', 't' }, '<leader>m', bmui.toggle_quick_menu)

vim.keymap.set({ 'n' }, '<leader>gg', ':Neogit<CR>')
