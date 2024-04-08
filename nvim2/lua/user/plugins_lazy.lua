--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ import = "user/plugins" },
	-- "folke/which-key.nvim",
	-- { "folke/neoconf.nvim", cmd = "Neoconf" },
	-- "folke/neodev.nvim",
	-- "wbthomason/packer.nvim",
	"tpope/vim-sensible",
	-- nerdtree
	-- { "scrooloose/nerdtree", { on = "NERDTreeToggle" } },
	"scrooloose/nerdtree",
	--
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	keys = {
	-- 		{ "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	-- 	},
	-- 	config = function()
	-- 		require("neo-tree").setup()
	-- 	end,
	-- },

	--use("scrooloose/nerdcommenter")
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	--use("bronson/vim-trailing-whitespace")
	-- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",      event = "VeryLazy" },
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	build = ":TSUpdate",
	-- 	event = { "BufReadPost", "BufNewFile" },
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter-textobjects",
	-- 	},
	-- },
	"nvim-treesitter/playground",
	-- language
	"rust-lang/rust.vim",

	-- other plugins
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"akinsho/bufferline.nvim",
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	"akinsho/toggleterm.nvim",
	-- "jlanzarotta/bufexplorer",

	-- lua line
	{ "nvim-lualine/lualine.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	-- "kyazdani42/nvim-web-devicons",

	--use 'nvim-tree/nvim-tree.lua'

	-- cmp plugins
	-- "neovim/nvim-lspconfig",
	-- "hrsh7th/cmp-nvim-lsp",
	-- "hrsh7th/cmp-cmdline",
	-- "hrsh7th/nvim-cmp",

	-- snippets
	-- "L3MON4D3/LuaSnip", --snippet engine
	-- "saadparwaiz1/cmp_luasnip",

	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	"RRethy/vim-illuminate",

	-- LSP
	--use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	-- "williamboman/mason.nvim",
	-- "williamboman/mason-lspconfig.nvim",

	-- formatting & linting
	-- "jose-elias-alvarez/null-ls.nvim",
	-- use("jayp0521/mason-null-ls.nvim")
	-- "jay-babu/mason-null-ls.nvim",
	-- formatter
	-- "mhartington/formatter.nvim",
	-- Telescope
	--use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- BurntSushi/ripgrep: brew install ripgrep
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	branch = "0.1.x",
	-- 	-- tag = "0.1.1",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		{
	-- 			"nvim-telescope/telescope-fzf-native.nvim",
	-- 			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	-- 			cond = vim.fn.executable("cmake") == 1,
	-- 		},
	-- 	},
	-- },

	-- FZF

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	"lunarvim/darkplus.nvim",

	-- "github/copilot.vim",

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})
