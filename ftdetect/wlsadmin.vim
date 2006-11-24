"------------------------------------------------------------------------------
"  Description: Snip Snap detection file
"     Language: Snip Snap Wiki
"          $Id: wlsadmin.vim,v 1.1 2006/11/24 12:05:04 krischikm Exp $
"    Copyright: Copyright (C) 2006 Martin Krischik
"   Maintainer: Martin Krischik
"      $Author: krischikm $
"	 $Date: 2006/11/24 12:05:04 $
"      Version: 0.1
"    $Revision: 1.1 $
"     $HeadURL: https://svn.sourceforge.net/svnroot/gnuada/trunk/tools/vim/ftdetect/ada.vim $
"      History: 20.11.2006 MK SnipSnap Wiki Syntax
"    Help Page: ft-snipnap-plugin
"------------------------------------------------------------------------------

if exists("s:loaded_ftdetect_snipsnap")
    finish
endif

let s:loaded_ftdetect_snipsnap=01

autocmd BufNewFile,BufRead mbeans.conf setfiletype wlsadmin

finish " 1}}}

"------------------------------------------------------------------------------
"   Copyright (C) 2006	Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
