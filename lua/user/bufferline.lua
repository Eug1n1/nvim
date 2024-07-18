local is_ok, bufferline = pcall(require, "bufferline")
if not is_ok then
	vim.notify("bufferline not found")
	return
end

bufferline.setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
})
