local is_ok, toggleterm = pcall(require, "toggleterm")
if not is_ok then
	vim.notify("toggleterm is missing")
	return
end

toggleterm.setup()

Terminals = {}

local Terminal = require("toggleterm.terminal").Terminal

Terminals.lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
Terminals.float = Terminal:new({
	direction = "float",
	hidden = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-\\>", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})
Terminals.vertical = Terminal:new({
	direction = "vertical",
	size = 60,
	hidden = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-\\>", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})

Terminals.horizontal = Terminal:new({
	direction = "horizontal",
	hidden = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-\\>", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<C-`>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

return Terminals
