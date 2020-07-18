call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/LeaderF'
Plug 'tamago324/LeaderF-filer'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-dark'
Plug 'jreybert/vimagit'
Plug 'dominikduda/vim_current_word'

" Initialize plugin system
call plug#end()

set ic
set hlsearch
syntax on
set encoding=UTF-8
set wildmenu
set mouse=a
set clipboard=unnamedplus

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

command! RefreshConfig :source ~/.vimrc

" Package manage 
nnoremap <Leader>hpi :PlugInstall<CR>
nnoremap <Leader>hpu :PlugUpdate<CR>
nnoremap <Leader>hpl :PlugStatus<CR>

" File menu 
nnoremap <Leader>feR :RefreshConfig<CR> :noh<CR>
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>ff :Leaderf filer<CR>
nnoremap <Leader>fr :LeaderfMru<CR>

" Quit Menu
nnoremap <Leader>qq :exit<CR>

" Search
nnoremap <Leader>sc :noh<CR>
" RipGrep word under cursor in directory
noremap <Leader>sw :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" RipGrep Visual selection in directory 
xnoremap <Leader>sp :<C-U><C-R>=printf("Leaderf rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR><CR>
" search selected word literally only in current buffer
noremap <Leader>ss :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", leaderf#Rg#visual())<CR><CR>
" <Space>se from spacemacs
nnoremap <Leader>se  :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR> <bar> :%s/\<<C-r><C-w>\>/
vnoremap <Leader>se "hy:%s/<C-r>h/
nnoremap <*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Window Menu
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
nnoremap <Leader>bb :CtrlPBuffer<CR>

" Magit
nnoremap <Leader>gs :Magit<CR>

" Command Menu
nnoremap <Leader><Leader> :
execute "set <M-x>=\ex"
nnoremap <M-x> :

" Visual
vmap io iw

" Statusbar
set laststatus=2

" Themes
colorscheme space-vim-dark
hi Search ctermbg=52
hi Search ctermfg=White

