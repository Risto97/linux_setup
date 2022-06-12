function! VisualSelection() abort
    " echo "nekitexxtt"
  try
    let a_save = @a
    silent! normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', '', 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
