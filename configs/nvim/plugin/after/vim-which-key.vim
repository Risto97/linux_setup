" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
nnoremap <silent> , :silent <c-u> :silent WhichKey ','<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
let g:which_key_map['/'] = [ ':Commentary'  , 'comment' ]

" Group mappings

let g:which_key_map.f = { 'name' : '+file' }
let g:which_key_map.f.s = 'save-file'
let g:which_key_map.f.f = 'open-file'
let g:which_key_map.f.e = { 'name' : '+config' }
let g:which_key_map.f.e.R = 'reload-config'
let g:which_key_map.f.e.d = 'edit-config'
let g:which_key_map.f.r = 'recent-file'

let g:which_key_map.b = { 'name' : '+buffer' }
let g:which_key_map.b.p = 'buffer-previous'
let g:which_key_map.b.n = 'buffer-next'
let g:which_key_map.b.b = 'buffer-list'

let g:which_key_map.t = { 'name' : '+toggles' }
let g:which_key_map.t.n = 'line-numbers'
let g:which_key_map.t.8 = 'Highlight long lines'


let g:which_key_map.s = { 'name' : '+search' }
let g:which_key_map.s.c = 'clear highlight'
let g:which_key_map.s.w = 'rg word under cursor'
let g:which_key_map.s.p = 'rg visual in dir'
let g:which_key_map.s.s = 'rg word in buffer'
let g:which_key_map.s.e = 'replace word in buffer'

let g:which_key_map.w = { 'name' : '+window' }
"let g:which_key_map.w. = 'split vertical'
"let g:which_key_map.w._ = 'split horizontal'
let g:which_key_map.w.d = 'delete window'
"let g:which_key_map.w."Down" = 'Focus down'
"let g:which_key_map.w."Up" = 'Focus Up'
"let g:which_key_map.w."Left" = 'Focus Left'
"let g:which_key_map.w.→ = 'Focus Right'


" Register which key map
call which_key#register('<Space>', "g:which_key_map")
