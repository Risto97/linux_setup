let g:Lf_ShowDevIcons = 0
let g:Lf_FilerShowHiddenFiles = 1
let g:Lf_FilerShowPromptPath = 1
let g:Lf_ShowRelativePath = 0

let g:Lf_FilerUseDefaultInsertMap = 0
let g:Lf_FilerInsertMap = {
    \   '<Left>':        'open_parent_or_backspace',
    \   '<Right>':        'open_current',
    \   '<Tab>':        'open_current',
    \   '<C-y>':        'toggle_hidden_files',
    \   '<C-g>':        'goto_root_marker_dir',
    \   '<Esc>':        'quit',
    \   '<C-c>':        'quit',
    \   '<CR>':         'accept',
    \   '<C-s>':        'accept_horizontal',
    \   '<C-v>':        'accept_vertical',
    \   '<C-t>':        'accept_tab',
    \   '<C-r>':        'toggle_regex',
    \   '<BS>':         'backspace',
    \   '<C-u>':        'clear_line',
    \   '<C-w>':        'delete_left_word',
    \   '<C-d>':        'delete',
    \   '<C-o>':        'paste',
    \   '<C-a>':        'home',
    \   '<C-e>':        'end',
    \   '<C-b>':        'left',
    \   '<C-f>':        'right',
    \   '<Down>':        'down',
    \   '<Up>':        'up',
    \   '<C-p>':        'prev_history',
    \   '<C-n>':        'next_history',
    \   '<C-q>':        'preview',
    \   '<C-x>':        'switch_normal_mode',
    \   '<C-Up>':       'page_up_in_preview',
    \   '<C-Down>':     'page_down_in_preview',
    \   '<ScroollWhellUp>': 'up3',
    \   '<ScroollWhellDown>': 'down3',
    \}

let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_PreviewInPopup = 1
let g:Lf_PopupColorscheme = 'default'
let g:Lf_PopupWidth = &columns * 3 / 4
let g:Lf_PopupHeight = 0.3
let g:Lf_AutoResize = 0
let g:Lf_WindowHeight = 0.30
