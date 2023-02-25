local is_ok, kommentary = pcall(require, "kommentary.config")
if not is_ok then
	vim.notify("kommentary was not found")
	return
end

kommentary.configure_language("default", {
	prefer_single_line_comments = true,
})
