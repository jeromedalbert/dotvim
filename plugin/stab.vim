" put all this in your .vimrc or a plugin file
command! -nargs=* Stab call Stab(<f-args>)
function! Stab()
  if a:0
    let l:tabstop = 1 * a:0
  else
    let l:tabstop = 1 * input('set shiftwidth=')
  endif

  if l:tabstop > 0
    " do we want expandtab as well?
    if a:1
      let l:expandtab = a:1
    else
      let l:expandtab = confirm('set expandtab?', "&Yes\n&No\n&Cancel")
    endif
    if l:expandtab == 3
      " abort?
      return
    endif

    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop

    if l:expandtab == 1
      setlocal expandtab
    else
      setlocal noexpandtab
    endif
  endif

  " show the selected options
  try
    echohl ModeMsg
    echon 'set tabstop='
    echohl Question
    echon &l:ts
    echohl ModeMsg
    echon ' shiftwidth='
    echohl Question
    echon &l:sw
    echohl ModeMsg
    echon ' sts='
    echohl Question
    echon &l:sts . ' ' . (&l:et ? '  ' : 'no')
    echohl ModeMsg
    echon 'expandtab'
  finally
    echohl None
  endtry
endfunction
