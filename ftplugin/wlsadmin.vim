"------------------------------------------------------------------------------
"  Description: Perform SnipSnap specific completion & tagging.
"     Language: Snip Snap Wiki
"	   $Id: wlsadmin.vim,v 1.1 2006/11/24 12:05:04 krischikm Exp $
"   Maintainer: Martin Krischik
"      $Author: krischikm $
"	 $Date: 2006/11/24 12:05:04 $
"      Version: 0.1
"    $Revision: 1.1 $
"     $HeadURL: https://svn.sourceforge.net/svnroot/gnuada/trunk/tools/vim/ftplugin/ada.vim $
"      History: 20.11.2006 MK SnipSnap Wiki Syntax
"    Help Page: ft-snipsnap-plugin
"------------------------------------------------------------------------------

" Only do this when not done yet for this buffer
if exists ("b:did_ftplugin") || version < 700
   finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 01

"
" Temporarily set cpoptions to ensure the script loads OK
"
let s:cpoptions = &cpoptions
set cpoptions-=C

" Section: File-Option {{{1
"
setlocal encoding=utf-8
setlocal wrap
setlocal smartcase
setlocal noignorecase

" Section: Comments {{{1
"
setlocal comments=O:#,:#\ 
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i

" Section: Tagging {{{1
"
setlocal iskeyword+=- 

" Section: Completion {{{1
"
setlocal omnifunc=syntaxcomplete#Complete
setlocal completefunc=wlsadmin#User_Complete

if exists ("g:wls_extended_completion")
   if mapcheck ('<C-N>','i') == ''
      inoremap <unique> <buffer> <C-N> <C-R>=wlsadmin#Completion("\<lt>C-N>")<cr>
   endif
   if mapcheck ('<C-P>','i') == ''
      inoremap <unique> <buffer> <C-P> <C-R>=wlsadmin#Completion("\<lt>C-P>")<cr>
   endif
   if mapcheck ('<C-X><C-]>','i') == ''
      inoremap <unique> <buffer> <C-X><C-]> <C-R>=<SID>wlsadmin#Completion("\<lt>C-X>\<lt>C-]>")<cr>
   endif
   if mapcheck ('<bs>','i') == ''
      inoremap <silent> <unique> <buffer> <bs> <C-R>=wlsadmin#Insert_Backspace ()<cr>
   endif
endif

" Section: Matchit {{{1
"

" Section: Folding {{{1
"
setlocal foldmethod=marker

" Section: Abbrev {{{1
"

" Section: Commands, Mapping, Menus {{{1
"

" 1}}}
" Reset cpoptions
let &cpoptions = s:cpoptions
unlet s:cpoptions

finish " 1}}}

"------------------------------------------------------------------------------
"   Copyright (C) 2006	Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker nospell
