source ~/.config/nvim/plugin/highlight_long_lines.vim

call plug#begin('~/.config/nvim/plugged')

Plug 'Yggdroot/LeaderF'
Plug 'tamago324/LeaderF-filer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'chrisbra/colorizer'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-dark'
Plug 'jreybert/vimagit'
Plug 'dominikduda/vim_current_word'
Plug 'liuchengxu/vim-which-key'
Plug 'tomtom/tcomment_vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-quickrun'
Plug 'moll/vim-bbye'

" Initialize plugin system
call plug#end()

set ic
set hlsearch
syntax on
set encoding=UTF-8
set wildmenu
set mouse=a
set clipboard=unnamedplus
set autochdir


nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = ","


command! RefreshConfig :source $MYVIMRC

" Terminal mode
nnoremap <Leader><CR> :sp<CR> :terminal<CR> :resize 10<CR> i
tnoremap <Esc> <C-\><C-n>

" Package manage
nnoremap <Leader>hpi :PlugInstall<CR>
nnoremap <Leader>hpu :PlugUpdate<CR>
nnoremap <Leader>hpl :PlugStatus<CR>

let g:Lf_ShortcutF = ""
let g:Lf_ShortcutB = ""

" File menu
nnoremap <Leader>feR :RefreshConfig<CR> :noh<CR>
nnoremap <Leader>fed :e $MYVIMRC<CR>
nnoremap <silent> <Leader>fs :w<CR>
nnoremap <Leader>ff :Leaderf filer<CR>
nnoremap <Leader>fr :LeaderfMru<CR>
nnoremap <Leader>fR :Rename <C-R>=expand("%:t")<CR>
nnoremap <Leader>fD :Unlink

" Toggles
nnoremap <Leader>tn :set number!<CR>
" Highlight long lines, need to clear matching
nnoremap <Leader>t8 :call g:Hll_active()<CR>

" Clap
nnoremap <Leader>dc :Clap<CR>

" Quit Menu
nnoremap <Leader>qq :qa<CR>

" Search
nnoremap <Leader>sc :noh<CR>
" RipGrep word under cursor in directory
noremap <Leader>sw :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" RipGrep Visual selection in directory
xnoremap <Leader>sp :<C-U><C-R>=printf("Leaderf rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR><CR>
" search selected word literally only in current buffer
noremap <Leader>ss :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", leaderf#Rg#visual())<CR><CR>
" <Space>se from spacemacs
" nnoremap <Leader>se  :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR> <bar> :%s/\<<C-r><C-w>\>/
" nmap <Leader>se  <C-n>
" vnoremap <Leader>se "hy:%s/<C-r>h/
nnoremap <*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Window Menu
set splitbelow
set splitright
nnoremap <Leader>w/ :vsp<CR>
nnoremap <Leader>w_ :sp<CR>
nnoremap <Leader>wd :q<CR>
nnoremap <Leader>w<Down> <C-W><C-J>
nnoremap <Leader>w<Up> <C-W><C-K>
nnoremap <Leader>w<Right> <C-W><C-L>
nnoremap <Leader>w<Left> <C-W><C-H>


" Buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bb :LeaderfBuffer<CR>

" Git
nnoremap <Leader>gs :Magit<CR>
nnoremap <Leader>glc :Clap commits<CR>

" Command Menu
nnoremap <Leader><Leader> :
" execute "set <M-x>=\ex"
nnoremap <M-x> :

" Visual
vmap io iw

" Quickrun 
nnoremap ,cc :QuickRun<CR>


" Statusbar
set laststatus=2

" Themes
colorscheme space-vim-dark


" Search result colours
hi Search ctermbg=52
hi Search ctermfg=White

source ~/.config/nvim/plugin/after/vim-which-key.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/plugin/after/vim-multiple-cursor.vim

