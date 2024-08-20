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
	-- "scrooloose/nerdtree",

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
	-- "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"akinsho/bufferline.nvim",
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	"akinsho/toggleterm.nvim",

	-- lua line
	{ "nvim-lualine/lualine.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	"RRethy/vim-illuminate",

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
