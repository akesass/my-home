"
set guioptions-=T
"メニューバーを表示しない
set guioptions-=m

"Windowを最大化する
if has('win32')
	autocmd GUIEnter * simalt~x
	"VimTip 1336: Open Windows Explorer showing directory of current buffer
	nmap <F11> :!start explorer /e,,%:p:h<CR>
	imap <F11> <Esc><F11>

	"他のVimで開いているファイルを開こうとしたときに開いているものをポップアップさせる
	runtime macros/editexisting.vim
endif

" MacVim-Kaoriya起動時に、最大化
if has('gui_macvim')
	set  lines=999
	set columns=9999
	nmap <F6> :!open %:p:h<CR>
	imap <F6> <Esc><F6>
endif
