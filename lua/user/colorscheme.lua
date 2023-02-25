local M = {}

M.colorschemes_set = {
	dark = "darkplus",
	light = "ayu-light",
}

M.is_dark = true

vim.g.onedarker_italic_keywords = false
vim.g.onedarker_italic_functions = false
vim.g.onedarker_italic_comments = true
vim.g.onedarker_italic_loops = false
vim.g.onedarker_italic_conditionals = false

function M.set_colorscheme(colorscheme)
	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
	end
end

if M.is_dark then
	M.set_colorscheme(M.colorschemes_set.dark)
else
	M.set_colorscheme(M.colorschemes_set.light)
end

return M
