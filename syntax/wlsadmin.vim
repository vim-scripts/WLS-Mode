"----------------------------------------------------------------------------
"  Description: Vim wlsadmin syntax file
"     Language: wlsadmin.Admin Command-Line Reference
"	   $Id: wlsadmin.vim,v 1.3 2006/11/24 12:05:04 krischikm Exp $
"    Copyright: Copyright (C) 2006 Martin Krischik
"   Maintainer: Martin Krischik
"      $Author: krischikm $
"	 $Date: 2006/11/24 12:05:04 $
"      Version: 0.1
"    $Revision: 1.3 $
"     $HeadURL: https://svn.sourceforge.net/svnroot/gnuwlsadmin/trunk/tools/vim/syntax/wlsadmin.vim $
"		http://www.dwheeler.com/vim
"      History: 08.11.2006 MK A wlsadmin Syntax file
"    Help Page: help ft-wlsadmin-syntax
"------------------------------------------------------------------------------
" wlsadmin Server Command Reference
" wlsadmin.Admin Command-Line Reference
" http://e-docs.bea.com/wls/docs81/admin_ref/index.html 
"------------------------------------------------------------------------------

if exists("b:current_syntax") || version < 700
    finish
endif

let b:current_syntax = "wlsadmin"

" Section: wlsadmin is entirely case-sensitive. {{{1
"
syntax   case match
syntax   spell notoplevel
setlocal nosmartcase
setlocal ignorecase

" Section: Highlighting known words {{{1
"
for b:Item in g:wlsadmin#Keywords
   if b:Item['kind'] == "k"
      execute "syntax keyword wlsadminCommand "     . b:Item['word']
   endif
   if b:Item['kind'] == "t"
      execute "syntax keyword wlsadminType "        . b:Item['word']
   endif
   if b:Item['kind'] == "s" 
      execute "syntax keyword wlsadminOption "      . b:Item['word']
   endif
   if b:Item['kind'] == "p" 
      execute "syntax keyword wlsadminProperty "     . b:Item['word']
   endif
   if b:Item['kind'] == "v" 
      execute "syntax keyword wlsadminValue "        . b:Item['word']
   endif
endfor

" Section: Operatoren {{{1
"
syntax match wlsadminPreproc /|$/

" Section: Assignment {{{1
"
syntax match wlsadminOperator /[,=]/

" Section: Structures. {{{1
"
syntax match wlsadminStructure /\<\k\+:\k\+\>/

" Section: Storrage Path. {{{1
"
syntax match wlsadminStorageClass /\(\/\k\+\)\{2,}/

" Section: Storrage Path. {{{1
"
syntax match wlsadminTypedef /\<\k\+\(\.\k\+\)\+\>/

" Section: Space Errors {{{1
"
if exists("g:wlsadmin_space_errors")
   if !exists("g:wlsadmin_no_trail_space_error")
       syntax match   wlsadminSpaceError	 excludenl /\s\+$/
   endif
   if !exists("g:wlsadmin_no_tab_space_error")
      syntax match   wlsadminSpaceError	 / \+\t/me=e-1
   endif
   if !exists("g:wlsadmin_all_tab_usage")
      syntax match   wlsadminSpecial	 /\t/
   endif
endif


" Section: String and character constants. {{{1
"
syntax region  wlsadminString	contains=@Spell start=/"/ skip=/""/ end=/"/ 
syntax match   wlsadminCharacter /'.'/

" Section: Todo (only highlighted in comments) {{{1
"
syntax keyword wlsadminTodo contained TODO FIXME XXX NOTE

" Section: Comments. {{{1
"
syntax region  wlsadminComment 
    \ oneline 
    \ contains=wlsadminTodo,wlsadminLineError,@Spell
    \ start=/#/ 
    \ end=/$/

" Section: line errors {{{1
"
" Note: Line errors have become quite slow with Vim 7.0
"
if exists("g:wlsadmin_line_errors")
    syntax match wlsadminLineError /\(^.\{79}\)\@<=./  contains=ALL containedin=ALL
endif

" Section: The default methods for highlighting. Can be overridden later. {{{1
"
"highlight def link wlsadminBoolean	    Boolean
"highlight def link wlsadminError	    Error
"highlight def link wlsadminInc	            Include
"highlight def link wlsadminLabel	    Label
"highlight def link wlsadminRepeat	    Repeat
"highlight def link wlsadminStatement	    Statement
highlight def link wlsadminTypedef	    Typedef
highlight def link wlsadminStorageClass     StorageClass
highlight def link wlsadminOperator         Operator
highlight def link wlsadminCharacter	    Character
highlight def link wlsadminCommand          Keyword
highlight def link wlsadminComment	    Comment
highlight def link wlsadminLineError	    Error
highlight def link wlsadminOption           Conditional 
highlight def link wlsadminPreproc	    PreProc
highlight def link wlsadminType	            Type
highlight def link wlsadminProperty	    Exception
highlight def link wlsadminSpaceError       Error
highlight def link wlsadminSpecial	    Special
highlight def link wlsadminString	    String
highlight def link wlsadminStructure	    Structure
highlight def link wlsadminTodo	            Todo
highlight def link wlsadminValue	    Number

" Section: formatoptions {{{1
"
setlocal formatoptions+=ron

" Section: sync {{{1
"
" We don't need to look backwards to highlight correctly;
" this speeds things up greatly.
syntax sync minlines=1 maxlines=1

finish " 1}}}

"------------------------------------------------------------------------------
"   Copyright (C) 2006	Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
"vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
"vim: foldmethod=marker
