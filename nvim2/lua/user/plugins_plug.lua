local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.vim/plugged")

Plug("tpope/vim-sensible")
-- nerdtree
Plug("scrooloose/nerdtree", { on = "NERDTreeToggle" })

Plug("scrooloose/nerdcommenter")
Plug("bronson/vim-trailing-whitespace")
Plug("nvim-treesitter/nvim-treesitter", { on = "TSUpdate" })
-- language
Plug("rust-lang/rust.vim")

-- other plugins
Plug("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
Plug("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
Plug("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
Plug("akinsho/bufferline.nvim")
Plug("akinsho/toggleterm.nvim")
--Plug "jlanzarotta/bufexplorer"

-- lua line
Plug("nvim-lualine/lualine.nvim")
Plug("kyazdani42/nvim-web-devicons")

--Plug 'nvim-tree/nvim-tree.lua'
Plug("akinsho/toggleterm.nvim")

-- cmp plugins
Plug("hrsh7th/nvim-cmp") -- The completion plugin
Plug("hrsh7th/cmp-buffer") -- buffer completions
Plug("hrsh7th/cmp-path") -- path completions
Plug("hrsh7th/cmp-cmdline") -- cmdline completions
Plug("saadparwaiz1/cmp_luasnip") -- snippet completions
Plug("hrsh7th/cmp-nvim-lsp")
Plug("RRethy/vim-illuminate")

-- snippets
Plug("L3MON4D3/LuaSnip") --snippet engine
Plug("rafamadriz/friendly-snippets") -- a bunch of snippets to use

-- LSP
Plug("neovim/nvim-lspconfig") -- enable LSP
--Plug "williamboman/nvim-lsp-installer" -- simple to use language server installer
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
--Plug "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
Plug("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

-- Telescope
Plug("nvim-telescope/telescope.nvim")

-- Colorschemes
-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
Plug("lunarvim/darkplus.nvim")

-- Git
Plug("lewis6991/gitsigns.nvim")

-- fzf
--Plug 'junegunn/fzf'
--Plug('junegunn/fzf', { on = "plug@fzf#install()" })
--Plug 'junegunn/fzf.vim'

vim.call("plug#end")
