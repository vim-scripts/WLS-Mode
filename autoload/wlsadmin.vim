"------------------------------------------------------------------------------
"  Description: Perform wlsadminspecific completion & tagging.
"     Language: wlsadmin (2005)
"	   $Id: wlsadmin.vim,v 1.2 2006/11/24 11:48:59 krischikm Exp $
"   Maintainer: Martin Krischik
"		Neil Bird <neil@fnxweb.com>
"      $Author: krischikm $
"	 $Date: 2006/11/24 11:48:59 $
"      Version: 0.1
"    $Revision: 1.2 $
"     $HeadURL: https://svn.sourceforge.net/svnroot/gnuwlsadmin/trunk/tools/vim/autoload/wlsadmin.vim $
"      History: 08.11.2006 MK A wlsadmin Syntax file
"    Help Page: ft-wlsadmin-functions
"------------------------------------------------------------------------------

if version < 700
   finish
endif 

let g:wlsadmin#Keywords	   = []

" Section: g:wlsadmin#Keywords {{{1
"
" Section: add wlsadmin keywords {{{2
"
for Item in ['STOREUSERCONFIG', 'CANCEL_SHUTDOWN', 'DISCOVERMANAGEDSERVER', 'FORCESHUTDOWN', 'LOCK', 'RESUME', 'SHUTDOWN', 'START', 'STARTINSTANDBY', 'UNLOCK', 'CONNECT', 'GETSTATE', 'HELP', 'LICENSES', 'LIST', 'PING', 'SERVERLOG', 'THREAD_DUMP', 'VERSION', 'CREATE_POOL', 'DESTROY_POOL', 'DISABLE_POOL', 'ENABLE_POOL', 'TEST_POOL', 'RESET_POOL', 'EXISTS_POOL', 'CREATE', 'DELETE', 'GET', 'INVOKE', 'QUERY', 'SET', 'BATCHUPDATE', 'CLUSTERSTATE', 'MIGRATE', 'STARTCLUSTER', 'STOPCLUSTER', 'VALIDATECLUSTERCONFIG', 'PURGETASKS']
    let g:wlsadmin#Keywords += [{
	    \ 'word':  Item,
	    \ 'menu':  'command keyword',
	    \ 'info':  'wlsadmin command.',
	    \ 'kind':  'k',
	    \ 'icase': 0}]
endfor

" Section: add	standart properties {{{2
"
for Item in ['Realm', 'ActiveTypes', 'Base64DecodingRequired', 'CertificateAlias', 'AplatSignerTruststore', 'KindOfUserId', 'Realm', 'ControlFlag', 'Application', 'AuthenticationProviders']
    let g:wlsadmin#Keywords += [{
	    \ 'word':  Item,
	    \ 'menu':  'properties',
	    \ 'info':  'wlsadmin known properties.',
	    \ 'kind':  'p',
	    \ 'icase': 0}]
endfor

" Section: add wlsadmin primary option {{{2
"
for Item in ['-mbean']
    let g:wlsadmin#Keywords += [{
	    \ 'word':  Item,
	    \ 'menu':  'command type',
	    \ 'info':  'wlsadmin primary option',
	    \ 'kind':  't',
	    \ 'icase': 1}]
endfor

" Section: add wlsadmin secondary option {{{2
"
for Item in ['-name', '-type', '-property', '-method']
    let g:wlsadmin#Keywords += [{
	    \ 'word':  Item,
	    \ 'menu':  'attribute',
	    \ 'info':  'wlsadmin secondary option.',
	    \ 'kind':  's',
	    \ 'icase': 0}]
endfor

" Section: add wlsadmin standart property values {{{2
"
for Item in ['false', 'true', 'signerCert', 'signerCert', 'signerCert', 'SUFFICIENT', 'loginId', 'isiwebsectoken']
    let g:wlsadmin#Keywords += [{
	    \ 'word':  Item,
	    \ 'menu':  'pragma',
	    \ 'info':  'wlsadmin pragma.',
	    \ 'kind':  'v',
	    \ 'icase': 0}]
endfor

" Section: Insert Completions {{{1
"
" Section: wlsadmin#User_Complete(findstart, base) {{{2
"
" This function is used for the 'complete' option.
"
function! wlsadmin#User_Complete(findstart, base)
   if a:findstart == 1
      "
      " locate the start of the word
      "
      let line = getline ('.')
      let start = col ('.') - 1
      while start > 0 && line[start - 1] =~ '\i\|'''
	 let start -= 1
      endwhile
      return start
   else
      "
      " look up matches
      "
      let l:Pattern = '^' . a:base . '.*$'
      "
      " add keywords
      "
      for Tag_Item in g:wlsadmin#Keywords
	 if l:Tag_Item['word'] =~? l:Pattern
	    if complete_add (l:Tag_Item) == 0
	       return []
	    endif
	    if complete_check ()
	       return []
	    endif
	 endif
      endfor
      return []
   endif
endfunction wlsadmin#User_Complete

" Section: wlsadmin#Completion (cmd) {{{2
"
" Word completion (^N/^R/^X^]) - force '.' inclusion
function wlsadmin#Completion (cmd)
   set iskeyword+=46
   return a:cmd . "\<C-R>=wlsadmin#Completion_End ()\<CR>"
endfunction wlsadmin#Completion

" Section: wlsadmin#Completion_End () {{{2
"
function wlsadmin#Completion_End ()
   set iskeyword-=46
   return ''
endfunction wlsadmin#Completion_End

" }}}1

lockvar! g:wlsadmin#Keywords

finish " 1}}}

"------------------------------------------------------------------------------
"   Copyright (C) 2006	Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=78 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
