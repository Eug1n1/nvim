local is_ok, telescope = pcall(require, "telescope")
if not is_ok then
	vim.notify("nvim_tree not found")
	return
end

telescope.setup({})
