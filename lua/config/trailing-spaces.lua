vim.opt.list = true

-- Define how trailing spaces and tabs should look
vim.opt.listchars:append({
    trail = "·", -- show trailing spaces as a middle dot
    tab = "» ", -- optional: show tabs
    extends = "›", -- optional: line continues right
    precedes = "‹" -- optional: line continues left
})

vim.api.nvim_set_hl(0, "ExtraWhitespace", { link = "ErrorMsg" })
-- Match trailing whitespace in all lines
vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
