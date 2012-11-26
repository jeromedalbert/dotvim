" Vim filetype plugin
" Language:		Markdown
" Maintainer:		Tim Pope <vimNOSPAM@tpope.org>

if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim

setlocal comments=fb:*,fb:-,fb:+,n:> commentstring=>\ %s
setlocal formatoptions+=tcqln
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+

let b:undo_ftplugin .= "|setl cms< com< fo<"

vnoremap +b <Esc>`>a**<Esc>`<i**<Esc>
vnoremap +i <Esc>`>a*<Esc>`<i*<Esc>
vnoremap +c <Esc>`>a`<Esc>`<i`<Esc>

" vim:set sw=2:
