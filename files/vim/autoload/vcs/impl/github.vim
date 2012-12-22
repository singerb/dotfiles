" Author:  Eric Van Dewoestine
"
" License: {{{
"   Copyright (c) 2005 - 2010, Eric Van Dewoestine
"   All rights reserved.
"
"   Redistribution and use of this software in source and binary forms, with
"   or without modification, are permitted provided that the following
"   conditions are met:
"
"   * Redistributions of source code must retain the above
"     copyright notice, this list of conditions and the
"     following disclaimer.
"
"   * Redistributions in binary form must reproduce the above
"     copyright notice, this list of conditions and the
"     following disclaimer in the documentation and/or other
"     materials provided with the distribution.
"
"   * Neither the name of Eric Van Dewoestine nor the names of its
"     contributors may be used to endorse or promote products derived from
"     this software without specific prior written permission of
"     Eric Van Dewoestine.
"
"   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
"   IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
"   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
"   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
"   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
"   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
"   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
"   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
"   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
"   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
"   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
" }}}

if !exists('g:vcs_github_loaded')
  let g:vcs_github_loaded = 1
else
  finish
endif

" GetLogUrl(root, file, args) {{{
function vcs#impl#github#GetLogUrl(root, file, args)
  return a:root . '/commits/' . a:args[0] . '/' . a:file
endfunction " }}}

" GetChangeSetUrl(root, file, args) {{{
function vcs#impl#github#GetChangeSetUrl(root, file, args)
  return a:root . '/commit/' . a:args[0]
endfunction " }}}

" GetAnnotateUrl(root, file, args) {{{
function vcs#impl#github#GetAnnotateUrl(root, file, args)
  return a:root . '/blame/' . a:args[0] . '/' . a:file
endfunction " }}}

" GetDiffUrl(root, file, args) Not supported by github {{{
function vcs#impl#github#GetDiffUrl(root, file, args)
  echoe 'Sorry, this function is not yet supported by github. Try using VcsWebChangeSet instead.'
  return
endfunction " }}}

" vim:ft=vim:fdm=marker
