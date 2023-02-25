local is_ok, hop = pcall(require, "hop")
if not is_ok then
	vim.notify("lsp_lines not found")
	return
end

local directions = require("hop.hint").HintDirection

hop.setup()

vim.keymap.set("", "f", function()
	hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { remap = true })
