source ~/.config/nvim/plugin/highlight_long_lines.vim
source ~/.config/nvim/plugin/close_window_by_name.vim

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
Plug 'dominikduda/vim_current_word'
Plug 'liuchengxu/vim-which-key'
Plug 'tomtom/tcomment_vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-quickrun'
Plug 'moll/vim-bbye'
Plug 'airblade/vim-rooter'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'pelodelfuego/vim-swoop'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'puremourning/vimspector'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'tpope/vim-fugitive'
Plug 'azidar/firrtl-syntax'
Plug 'pignacio/vim-yapf-format'

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
set autoread
au CursorHold * checktime  
set shortmess-=S
set scrolloff=6

" ================ Indentation ======================

set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab


nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = ","


command! RefreshConfig :source $MYVIMRC

" Terminal mode
nnoremap <Leader><CR> :sp<CR> :terminal<CR> :resize 10<CR> i
tnoremap <Esc> <C-\><C-n>

" Package manage
nnoremap <Leader>hpi :PlugInstall<CR>
nnoremap <Leader>hpc :PlugClean<CR>
nnoremap <Leader>hpu :PlugUpdate<CR>
nnoremap <Leader>hpl :PlugStatus<CR>

let g:Lf_ShortcutF = ""
let g:Lf_ShortcutB = ""

" File menu
command! CHD :chdir %:h
nnoremap <Leader>feR :RefreshConfig<CR> :noh<CR>
nnoremap <Leader>fed :e $MYVIMRC<CR>
nnoremap <silent> <Leader>fs :w<CR>
nnoremap <Leader>ff :Leaderf filer --auto-cd<CR>
nnoremap <Leader>f. :CHD<CR>
nnoremap <Leader>fF :Files<CR>
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
nnoremap <Leader>qQ :qa!<CR>
nnoremap <Leader>qr :SaveSession<CR> :qa<CR>
nnoremap <Leader>qs :OpenSession<CR>
let g:session_autosave = 0
let g:session_autoload = 0

" Search
nnoremap <Leader>sc :noh<CR>
" RipGrep word under cursor in directory
noremap <Leader>sp :<C-u><C-w>call RGProjectString(expand("<cword>"))<CR>
" RipGrep Visual selection in directory
xnoremap <Leader>sp  :<C-u><C-w>call RGProjectString(VisualSelection())<CR>

function! RGProjectString(query)
  let initial_command = printf(":RGProject %s", a:query)
  execute initial_command
endfunction

" search selected word literally only in current buffer
" noremap <Leader>ss :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", leaderf#Rg#visual())<CR><CR>
nnoremap <Leader>ss :call SwoopPattern("<C-R>=expand("<cword>")<CR>")<CR>
vmap <Leader>ss :call SwoopSelection()<CR>
nnoremap <*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Project
noremap <Leader>pf :RGProjectFiles<CR>


" Window Menu
set splitbelow
set splitright
nnoremap <Leader>w/ :vsp<CR>
nnoremap <Leader>w_ :sp<CR>
nnoremap <Leader>wd :q<CR>
nmap <Leader>w= <C-w>=
nnoremap <Leader>w<Down> <C-W><C-J>
nnoremap <Leader>w<Up> <C-W><C-K>
nnoremap <Leader>w<Right> <C-W><C-L>
nnoremap <Leader>w<Left> <C-W><C-H>
nnoremap ,cd :KillWindowNamed [quickrun output]<CR>
nmap <Leader>cd ,cd

" nnoremap <Leader>t8 :call g:Hll_active()<CR>

" Buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bY :%y<CR>
nnoremap <Leader>bP ggdG"0P

" Git
" nnoremap <Leader>gs :Magit<CR>
nnoremap <silent> <leader>gs :LazyGit<CR>
" nnoremap <Leader>glc :Clap commits<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.75 " scaling factor for floating window

" diff
nnoremap <Leader>db :diffthis<CR>
nnoremap <Leader>dw :windo diffthis<CR>
nnoremap <Leader>dq :windo diffoff<CR>

" Command Menu
nnoremap <Leader><Leader> :
" execute "set <M-x>=\ex"
nnoremap <M-x> :

" Visual
vmap io iw

" Quickrun 
nnoremap ,cc :QuickRun<CR>
nnoremap ,= :call Yapf()<cr>


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
source ~/.config/nvim/plugin/after/leaderf.vim
source ~/.config/nvim/helpers.vim
source ~/.config/nvim/plugged/fzf.vim/autoload/fzf/vim.vim

command! -bang ProjectFiles call fzf#vim#files('~/pulp', <bang>0)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:40%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!.git*'"

function! RipgrepFzf(query, fullscreen, path)
	let transformer  =  "| awk 'BEGIN{ FS=\":\"; OFS=FS } {n=split($1, a, \"/\"); $3=$3 \":\" a[n] \":\" $2 \":\" $3; print}'"
	let cmd_fmt = "rg --column --line-number --no-heading --hidden -g \"!{.git,node_modules,vendor}/*\" --color=always --smart-case %s %s "
	let rg_cmd = printf(cmd_fmt, shellescape(a:query), a:path)
	let reload_command = printf(cmd_fmt..transformer, '{q}', a:path)
	let spec={'options': ['--delimiter=:', '--with-nth=4..', '--query', a:query, '--bind', 'change:reload:'.reload_command] }
        echo "RG in" a:path
  	call fzf#vim#grep(rg_cmd..transformer, 1, fzf#vim#with_preview(spec) , a:fullscreen)
endfunction


command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0, '~')
command! -nargs=* -bang RGProject call RipgrepFzf(<q-args>, <bang>0, FindRootDirectory())
command! -bang RGProjectFiles call fzf#vim#files(FindRootDirectory(), <bang>0)

" Mapping to exit Fzf with Esc
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

filetype plugin on

"" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'


"" Create directory on save file

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
