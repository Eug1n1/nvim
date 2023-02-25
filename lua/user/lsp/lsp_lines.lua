local is_ok, lsp_lines = pcall(require, "lsp_lines")
if not is_ok then
	vim.notify("lsp_lines not found")
	return
end

lsp_lines.setup()
