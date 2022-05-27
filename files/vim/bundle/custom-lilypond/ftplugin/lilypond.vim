" LilyPond filetype plugin
" Language:     LilyPond (ft=ly)
" Maintainer:   Heikki Junes <hjunes@cc.hut.fi>
" Last Change:  2010 Jul 26
"
" Installed As:	vim/ftplugin/lilypond.vim
" Uses Generated File:	vim/syntax/lilypond-words.vim
"
" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

setlocal autoindent
setlocal shiftwidth=2
