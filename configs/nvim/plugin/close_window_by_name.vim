function! s:GetWindowID(name)
    let s:x=[]
    windo call add(s:x, [win_getid(), bufname('%')])

    for w in s:x
        if w[1] == a:name
            return w[0]
        endif
    endfor

    return -1
endfunction


function! s:KillWindowNamed(name)
    let s:old=win_getid()
    let s:id=s:GetWindowID(a:name)

    if s:id != -1
        call win_gotoid(s:id) 
       quit
    endif

    call win_gotoid(s:old)
endfunction

command! -nargs=1 KillWindowNamed call s:KillWindowNamed(<q-args>)
