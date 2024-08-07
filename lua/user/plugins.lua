local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	-- snapshot = "july-24",
	snapshot_path = fn.stdpath("config") .. "/snapshots",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded", -- Border style of prompt popups.
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugin Mangager
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use("nvim-lua/plenary.nvim")

	-- lua
	use("folke/neodev.nvim")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/nvim-cmp")
	use("ray-x/lsp_signature.nvim")
	use("lvimuser/lsp-inlayhints.nvim")
	use("amarakon/nvim-cmp-fonts")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- colorscheme
	use("RRethy/nvim-base16")
	use("lunarvim/darkplus.nvim")
	use("Shatur/neovim-ayu")

	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	use("windwp/nvim-autopairs")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("RRethy/vim-illuminate")

	use("SmiteshP/nvim-navic")
	use("fgheng/winbar.nvim")
	use("windwp/windline.nvim")

	use("b3nj5m1n/kommentary")

	use("norcalli/nvim-colorizer.lua")

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use("akinsho/toggleterm.nvim")

	use({
		"phaazon/hop.nvim",
		branch = "v2",
	})
	use("mfussenegger/nvim-treehopper")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
	})

	use("https://git.sr.ht/~p00f/nvim-ts-rainbow")
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })
end)
