"========== Leader keys ===================
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = ","

lua require("config.lazy")
lua require("helpers")
lua require("config.keybindings")
lua require("config.telescope")
lua require("config.filetypes")
lua require("config.lsp")
lua require("config.cmp")
lua require("config.treesitter")
lua require("config.neogen")

set ic                        " Ignore case when searching
set hlsearch                  " Highlight search matches
syntax on                     " Enable syntax highlighting
set encoding=UTF-8            " Use UTF-8 encoding
set wildmenu                  " Enable enhanced command-line completion
set mouse=a                   " Enable mouse support in all modes
set clipboard=unnamedplus     " Use system clipboard for copy/paste
set autochdir                 " Auto-change to file’s directory
set autoread                  " Auto-reload files changed outside Neovim
au CursorHold * checktime     " Check for external file changes when idle
set shortmess-=S              " Show search hit BOTTOM/TOP messages
set scrolloff=6               " Keep 6 lines visible above/below cursor

" ================ Indentation ======================

set autoindent                " Copy indent from current line when starting new one
set smartindent               " Auto-indent smartly based on syntax
set shiftwidth=4              " Indent width = 4 spaces
set tabstop=4                 " A tab character displays as 4 spaces
set smarttab                  " Make <Tab> in insert mode use shiftwidth
set expandtab                 " Convert tabs to spaces


" ================ Theme =============================
colorscheme doom-one
set background=dark

" Window Menu
set splitbelow                " Split and focus below
set splitright                " Split and focus right

set laststatus=2              " Always show statusline

