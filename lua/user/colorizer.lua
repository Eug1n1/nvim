local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	vim.notify("colorizer was not found")
	return
end

colorizer.setup({
	DEFAULT_OPTIONS = {
		RRGGBBAA = true,
	},
})
