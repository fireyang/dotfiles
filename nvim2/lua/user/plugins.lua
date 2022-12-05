-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("tpope/vim-sensible")
	-- nerdtree
	use("scrooloose/nerdtree", { on = "NERDTreeToggle" })

	use("scrooloose/nerdcommenter")
	use("bronson/vim-trailing-whitespace")
	use("nvim-treesitter/nvim-treesitter", { on = "TSUpdate" })
	-- language
	use("rust-lang/rust.vim")

	-- other plugins
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("akinsho/bufferline.nvim")
	use("akinsho/toggleterm.nvim")
	use("jlanzarotta/bufexplorer")

	-- lua line
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")

	--use 'nvim-tree/nvim-tree.lua'

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("RRethy/vim-illuminate")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	--use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- maximizes and restores current window
	use("szw/vim-maximizer")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("lunarvim/darkplus.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
