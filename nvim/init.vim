" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
" echo "test"

set nocompatible
filetype plugin indent off

" start plug
call plug#begin('~/.vim/plugged')
"endif
" general configs
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
"set incsearch
set hls
"set relativenumber
"set ls=2
"set cursorline
set nowrap
set backspace=indent,eol,start
set completeopt -=preview
set textwidth=95
set wildmenu
set ttyfast
set noshowmode
set cmdheight=1
set nu

" 不要生成swap文件
set noswapfile
"隐藏菜单栏
set guioptions-=m
"隐藏工具栏
set guioptions-=T
"set mapleader
let mapleader = ","
let g:snips_author = 'FireYang'
" ESC
noremap <leader><leader> <Esc>

map <leader>e :exec "edit" '~/.config/nvim/init.vim'<cr>

"设置命令行2行
set cmdheight=2
"设置缓存
set nobackup


" share system clipboard
if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
endif


" Split Management
" " ====>
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" VSplit
map <leader>vs :vsplit<cr><C-l>
" fast saving
map <leader>w :w<cr>
map <leader>q :q<cr>

" 显示全角半角
Plug 'bronson/vim-trailing-whitespace'

"{{{ 缩进可视化 ps:json 双引号不可见
Plug 'Yggdroot/indentLine'
" let g:indentLine_conceallevel = '0'
autocmd Filetype json let g:indentLine_setConceal = 0
autocmd Filetype markdown let g:indentLine_conceallevel = 0
"}}}
" 引号成对出线
Plug 'cohama/lexima.vim'

" 缩进提示线
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

"Golang
" Plug 'nsf/gocode', {'rtp': 'vim/'}
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" let g:syntastic_go_checkers = []
" let g:go_fmt_command = "goimports"
" let g:go_code_completion_enabled = 0

Plug 'uarun/vim-protobuf'

" Fuzzy finder
"{{{
Plug 'airblade/vim-rooter'
" let g:rooter_change_directory_for_non_project_files = 'current'
"}}}

" NERDTree插件的快捷键
Plug 'scrooloose/nerdtree'
"imap <silent> <F7> <esc>:NERDTreeToggle<CR>
"nmap <silent> <F7> :NERDTreeToggle<CR>
imap <leader>nt <esc>:NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeToggle<CR>
" bufkill bd's: really do not mess with NERDTree buffer
nnoremap <silent> <backspace> :BD<cr>
nnoremap <silent> <s-backspace> :BD!<cr>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>
"NERDTree过滤文件
let NERDTreeIgnore=['.lock$', '.svn$','.fla$','.doc$','.swc$','\.o$', '__pycache__']
"NERDTree标签文件目录
"let NERDTreeBookmarksFile='/Users/fireyang/soft/MacVim-7_3-53/NerdBookmarks.txt'
"let NERDTreeBookmarksFile='d:/Users/fireyang/soft/MacVim-7_3-53/NerdBookmarks.txt'
" }}}

"BufExplorer 插件{{{
"Plug 'bufexplorer.zip'
Plug 'jlanzarotta/bufexplorer'

" Close the current buffer
map <leader>bd :Bclose<cr>
"切换下一缓存区文件
map <leader>bn :bn<cr>
"切换上一缓存区文件
map <leader>bp :bp<cr>
" Close all the buffers
map <leader>ba :1,300 bd!<cr>
" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" rust lang
Plug 'rust-lang/rust.vim'
" let g:rustfmt_autosave = 1

Plug 'jistr/vim-nerdtree-tabs'
" let g:nerdtree_tabs_open_on_console_startup = 1

Plug 'Xuyuanp/nerdtree-git-plugin'
" 注释
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"{{{ 缩进可视化 ps:json 双引号不可见
Plug 'Yggdroot/indentLine'
" let g:indentLine_conceallevel = '0'
autocmd Filetype json let g:indentLine_setConceal = 0
autocmd Filetype markdown let g:indentLine_conceallevel = 0
"}}}

Plug 'scrooloose/syntastic'
" 显示git状态
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" nvim 插件
if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'
    " Plug 'akinsho/toggleterm.nvim'
else
endif

" fzf 插件 {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
map <silent> <leader>ff :FZF<CR>
map <silent> <leader>fb :Buffers<CR>
" }}}
map <silent> <leader>fg :Ag<CR>

" colorscheme desert
if has("mac")
    " colorscheme base16-default-dark
    " colorscheme jellybeans
else
    " colorscheme desert
endif

Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'
" Plug 'github/copilot.vim'

Plug 'akinsho/toggleterm.nvim'
Plug 'elixir-editors/vim-elixir'

Plug 'ziglang/zig.vim'

autocmd BufRead,BufNewFile *.ex,*.exs setlocal shiftwidth=2 tabstop=2

" Initialize plugin system
call plug#end()
filetype plugin indent on
syntax enable
