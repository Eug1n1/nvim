local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	vim.notify("null_ls is missing")
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.clang_format.with({
			extra_args = {
				"-style=WebKit",
			},
		}),
		null_ls.builtins.formatting.prettier.with({
			extra_args = {
				"--no-semi",
				"--single-quote",
				"--jsx-single-quote",
				"--tab-width",
				vim.opt.shiftwidth:get(),
			},
		}),

		-- null_ls.builtins.diagnostics.eslint.with({
		--     extra_args = { "--no-eslintrc" },
		-- }),
		-- null_ls.builtins.completion.spell,
	},
})
