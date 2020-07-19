let b:HLLActive = 0

function! g:Hll_active()
	let b:HLLActive = !b:HLLActive

	if b:HLLActive
		match ErrorMsg '\%>80v.\+'
	else
		match
	endif
endfunction

