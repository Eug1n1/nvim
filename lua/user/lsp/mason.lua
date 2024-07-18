local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	"html",
    "cssls",
	-- "jdtls",
	"pyright",
	"lua_ls",
	"tsserver",
	"bashls",
	"clangd",
	"rust_analyzer",
	-- "csharp_ls",
	"dockerls",
	"prismals",
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 2,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

require("neodev").setup()
local status_ok, neodev = pcall(require, "neodev")
if not status_ok then
	vim.notify("neodev not found")
	return
end

neodev.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("lspconfig not found")
	return
end

local on_attach = function(client, bufnr)
	vim.g.navic_silence = true
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		vim.notify("navic not found")
		return
	end

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- Mappings.
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gk", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "<C-k>", function()
		require("lsp_signature").toggle_float_win()
	end, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in pairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server == "clangd" then
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.offsetEncoding = "utf-8"

		opts.capabilities = capabilities
	end

	if server == "lua_ls" then
		opts.settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		}
	end

	lspconfig[server].setup(opts)
end
