source ~/.config/nvim/plugin/highlight_long_lines.vim
source ~/.config/nvim/plugin/close_window_by_name.vim
source ~/.config/nvim/helpers.vim
source ~/.config/nvim/plugin/after/leaderf.vim
source ~/.config/nvim/plugin/after/neoformat.vim
source ~/.config/nvim/plugin/quickrun_config.vim

lua require('plugins')
lua require('lua_line')
lua require('cmp_config')
lua require('lsp_setting')
lua require('fzf_lua')
lua require('config/treesitter')
lua require('config/autopairs')
"" lua require('config/shade_config')
lua require('config/comment')
lua require('config/git_config')
lua require('config/sniprun_config')
lua require('config/nvim_window_config')
lua require('utils')
lua require('keybindings')
lua require('config/which-key')

" hi BlackOnLightYellow guifg=#000000 guibg=#f2de91

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

" FZF
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:40%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!.git*'"

nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = ","


command! RefreshConfig :source $MYVIMRC

" Terminal mode
nnoremap <Leader><CR> :sp<CR> :terminal<CR> :resize 10<CR> i
tnoremap <Esc> <C-\><C-n>

" Package manager
nnoremap <Leader>hpi :PackerInstall<CR>
nnoremap <Leader>hpc :PackerClean<CR>
nnoremap <Leader>hpu :PackerUpdate<CR>
nnoremap <Leader>hpl :PackerStatus<CR>

let g:Lf_ShortcutF = ""
let g:Lf_ShortcutB = ""

" nnoremap ,k :Neoformat<CR>

" File menu
command! CHD :chdir %:h
nnoremap <Leader>feR :RefreshConfig<CR> :noh<CR>
nnoremap <Leader>fed :e $MYVIMRC<CR>
nnoremap <silent> <Leader>fs :w<CR>
nnoremap <Leader>ff :Leaderf filer --auto-cd<CR>
nnoremap <Leader>f. :CHD<CR>
nnoremap <Leader>fF :FzfLua files<CR>
nnoremap <Leader>fr :LeaderfMru<CR>
nnoremap <Leader>fR :call RenameFile()<CR>
nnoremap <Leader>fD :call delete(expand('%'))

" Toggles
nnoremap <Leader>tn :set number!<CR>
" Highlight long lines, need to clear matching
" nnoremap <Leader>t8 :call g:Hll_active()<CR>

" Quit Menu
nnoremap <Leader>qq :qa<CR>
nnoremap <Leader>qQ :qa!<CR>
" nnoremap <Leader>qr :SaveSession<CR> :qa<CR>
" nnoremap <Leader>qs :OpenSession<CR>
" let g:session_autosave = 0
" let g:session_autoload = 0

" Search
nnoremap <Leader>sc :noh<CR>
" RipGrep word under cursor in directory
noremap <Leader>sp :<cmd>lua require('fzf-lua').grep_project({ fzf_opts={ ['--query']=vim.fn.expand('<cword>') }})<CR><CR>
xnoremap <Leader>sp :<C-u><C-w>lua require('fzf-lua').grep_project({ fzf_opts={ ['--query']=vim.fn.VisualSelection() }})<CR>

" search selected word literally only in current buffer
" noremap <Leader>ss :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", leaderf#Rg#visual())<CR><CR>
let g:swoopUseDefaultKeyMap = 0
nnoremap <Leader>ss :call SwoopPattern("<C-R>=expand("<cword>")<CR>")<CR>
vmap <Leader>ss :call SwoopSelection()<CR>
nnoremap <*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Project
" noremap <Leader>pf :RGProjectFiles<CR>

" Line edits
" Reverse
vmap <Leader>lr :'<,'>!tac<CR>


" Window Menu
set splitbelow
set splitright
nnoremap <Leader>w/ :vsp<CR>
nnoremap <Leader>w_ :sp<CR>
nnoremap <Leader>wd :q<CR>
nmap <Leader>w= <C-w>=
nnoremap <Leader>w<Down> <C-W><C-J> :CHD<CR>
nnoremap <Leader>w<Up> <C-W><C-K> :CHD<CR>
nnoremap <Leader>w<Right> <C-W><C-L> :CHD<CR>
nnoremap <Leader>w<Left> <C-W><C-H> :CHD<CR>
nnoremap ,cd :KillWindowNamed [quickrun output]<CR>
" nmap <Leader>cd ,cd

" nnoremap <Leader>t8 :call g:Hll_active()<CR>

" Buffers
nnoremap <Leader>bn :BufSurfForward<CR> :CHD<CR>
nnoremap <Leader>bp :BufSurfBack<CR> :CHD<CR>
nnoremap <Leader>bb :FzfLua buffers<CR>
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
" nnoremap <Leader><Leader> :
" execute "set <M-x>=\ex"
nnoremap <M-x> :

" Visual
vmap io iw

" Quickrun 
nnoremap ,cc :QuickRun<CR>
nnoremap ,cm :make<CR>


" Statusbar
set laststatus=2

" Themes
" let g:material_style = "darker"
let g:palenight_color_overrides = {
\    'black': { 'gui': '#000000', "cterm": "0", "cterm16": "0" },
\}

if (has("termguicolors"))
 set termguicolors
endif
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_theme_style = 'default-community'
colorscheme doom-one
set background=dark

" Search result colours
hi Search ctermbg=52
hi Search ctermfg=White

" source ~/.config/nvim/plugged/fzf.vim/autoload/fzf/vim.vim


" Mapping to exit Fzf with Esc
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

filetype plugin on


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

augroup systemrdl_ft
  au!
  autocmd BufNewFile,BufRead *.rdl   set syntax=systemrdl
  autocmd BufNewFile,BufRead *.rdl   set filetype=systemrdl
augroup END

augroup jinja_ft
  au!
  autocmd BufNewFile,BufRead *.j2   set syntax=jinja
augroup END
augroup lds_ft
  au!
  autocmd BufNewFile,BufRead *.lds   set syntax=ld
augroup END
