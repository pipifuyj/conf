" 作者: pipifu 
" 安装: sudo apt-get install vim-gtk
" 用法: 将本文件(.vimrc)拷贝到$HOME/


"window :WMToggle
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap <F2> :WMToggle<cr>

"taglist :TlistToggle
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"nmap <F3> :TlistToggle<cr>

" 使用 murphy 调色板
colo ron 

" 设置用于GUI图形用户界面的字体列表。
set guifont=Mono\ 10

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" 设定文件浏览器目录为当前目录
set bsdir=buffer
set autochdir

" 设置编码
set enc=utf-8

" 设置文件编码
set fenc=utf-8

" 设置文件编码检测类型及支持格式
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" 指定菜单语言
set langmenu=zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 设置开启语法高亮
syntax on
syntax enable

" 设置语法高亮度
set syn=cpp

"显示行号
set nu!

" 查找结果高亮度显示
set nohlsearch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 在行和段开始处使用制表符
set smarttab

"set list listchars=tab:>-
autocmd FileType * set tabstop=4|set shiftwidth=4|set noexpandtab|set softtabstop=4
autocmd FileType python,perl set tabstop=4|set shiftwidth=4|set expandtab

" C/C++注释
set comments=://

" 修正自动C式样注释功能 <2005/07/16>
set comments=s1:/*,mb:*,ex0:/

" 增强检索功能
set tags=./tags,./../tags,./**/tags

" 保存文件格式
set fileformats=unix,dos

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=indent,eol,start

" 允许backspace和光标键跨越行边界
set whichwrap=b,s,<,>,[,]

" 键盘操作
map <Up> gk
map <Down> gj

" 命令行高度
set cmdheight=1

" 中文帮助
if version > 603
set helplang=cn
endif

" backup
if has("vms")
	set nobackup    
else
	set backup 
endif

set ruler

set showcmd 

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 在搜索的时候忽略大小写
set ignorecase

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" 总是显示状态行
set laststatus=2

" 自动格式化
set formatoptions=tcrqn

" 用空格键来开关折叠
set foldenable
set foldmethod=indent
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 侦测文件类型
filetype plugin on 
filetype indent on 
filetype on

" 保存全局变量
set viminfo+=!

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 设置VIM历史命令记录数
set history=300

" 当文件被修改的时候，自动读入变动 
set autoread

" 设置快捷键map的leader按键
let mapleader = ";"

" 快捷打开编辑vimrc文件的键盘绑定
map <silent> <leader>ee :e $HOME/.vimrc<cr>

" 快速保存w 替代 w! 
nmap <leader>w :w!<cr>

" 快速保存x 替代 x! 
nmap <leader>x :x!<cr>

" ^z快速进入shell
nmap <C-Z> :shell<cr>

"新建tab
nmap <S-T> :tabnew<cr>

"下一个tab
nmap <S-T><S-T> <ESC>:tabnext<cr>

"全选
nmap <C-A> ggVG
imap <C-A> <ESC><C-A>

"替换
map <C-H> :1,$s/from/to/c
imap <C-H> <Esc><C-H>

"设置建立新行但是不插入
map <S-O> o<ESC>

"设置快速不保存退出快捷键
map <S-Q> :q!<CR>:q!<CR>:q!<CR>

" 判断操作系统
if (has("win32") || has("win64") || has("win32unix"))
     let g:isWin = 1
     else
         let g:isWin = 0
         endif

" 判断是终端还是gvim
 if has("gui_running")
     let g:isGUI = 1
     else
         let g:isGUI = 0
         endif

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

"命令条高度
set cmdheight=1

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

"" 在命令模式下使用 Tab 自动补全的时候， 将补全内容使用一个漂亮的单行菜单形式显示出来。 
set wildmenu

""定义函数SetTitle，自动插入文件头 
func SetTitle() 
"如果文件类型为.sh文件 
if &filetype == 'sh' 
	call setline(1,"\#########################################################################") 
	call append(line("."), "\# Author: Pipi.Y.Fu") 
	call append(line(".")+1, "\# Created Time: ".strftime("%c")) 
	call append(line(".")+2, "\# File Name: ".expand("%")) 
	call append(line(".")+3, "\# Description: ") 
	call append(line(".")+4, "\#########################################################################") 
	call append(line(".")+5, "\#!/bin/bash") 
	call append(line(".")+6, "") 
elseif &filetype == 'php' 
		call setline(1, "<?php") 
		call append(line("."), "/*************************************************************************") 
		call append(line(".")+1, " Author: Pipi.Y.Fu") 
		call append(line(".")+2, " Created Time: ".strftime("%c")) 
		call append(line(".")+3, " File Name: ".expand("%")) 
		call append(line(".")+4, " Description: ") 
		call append(line(".")+5, " ************************************************************************/") 
		call append(line(".")+6, "?>") 
		call append(line(".")+7, "") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), " Author: Pipi.Y.Fu") 
		call append(line(".")+1, " Created Time: ".strftime("%c")) 
		call append(line(".")+2, " File Name: ".expand("%")) 
		call append(line(".")+3, " Description: ") 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "") 
		endif 
		endfunc 
map <F3> <Esc>:call SetTitle()<CR><Esc>:$<Esc>o

"注释代码使得不再起作用
function Comment()
	if &filetype == 'sh'
		let currline=getline(".")
		call setline(line("."),"#")
		call append(line("."),"#".currline."   commented by Pipi.Y.Fu@".strftime("%c"))
		call append(line(".")+1,"#")
	elseif &filetype == 'javascript'
		let currline=getline(".")
		call setline(line("."),"//".currline."   commented by Pipi.Y.Fu@".strftime("%c"))
	else 
		let currline=getline(".")
		call setline(line("."),"/*")
		call append(line(".")," *".currline."   commented by Pipi.Y.Fu@".strftime("%c"))
		call append(line(".")+1," */")
	endif
endfunc
map <F4> <Esc>:call Comment()<CR><Esc><S-O>

"添加注释
map <F5> <ESC>$a//

"代码格式化
function FormatSrc()
exec "w"
""C程序,Perl程序,Python程序
if &filetype == 'c'
	exec "!astyle --style=gnu --suffix=none %"
	exec "e! %"
elseif &filetype == 'cpp'
	exec "!astyle --style=gnu --suffix=none %"
	exec "e! %"
elseif &filetype == 'perl'
	exec "!astyle --style=gnu --suffix=none %"
	exec "e! %"
elseif &filetype == 'py'
	exec "!astyle --style=gnu --suffix=none %"
	exec "e! %"
elseif &filetype == 'java'
	exec "!astyle --style=java --suffix=none %"
	exec "e! %"
elseif &filetype == 'jsp'
	exec "!astyle --style=gnu --suffix=none %"
	exec "e! %"
elseif &filetype == 'xml'
	exec "!astyle --style=gnu --suffix=none %"
	exec "e! %"
elseif &filetype == 'html'
	exec "!astyle --style=gnu --suffix=none %"
	exec "e! %"
elseif &filetype == 'htm'
	exec "!astyle --style=gnu --suffix=none %"
	exec "e! %"
	endif
endfunc
""结束定义FormartSrc

"代码格式化
map <F11> <Esc>:call FormatSrc()<CR><Esc>:$<Esc>o

"在gvim中高亮当前行
if (g:isGUI)
	set cursorline
	hi cursorline guibg=#333333
	hi CursorColumn guibg=#333333
	set guifont=Consolas\ 14
	set guifontwide=Consolas\ 14
endif


" 根据给定方向搜索当前光标下的单词，结合下面两个绑定使用
function! VisualSearch(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"
	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")
	if a:direction == 'b'
		execute "normal ?" . l:pattern . "<cr>"
	else
		execute "normal /" . l:pattern . "<cr>"
	endif
	let @/ = l:pattern
	let @" = l:saved_reg
endfunction
" 用 */# 向 前/后 搜索光标下的单词
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"生成ctags
function Do_CsTag()
	if(executable ('cscope') && has("cscope") )
		if(g:iswin dows!=1)
			silent!  execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.cxx' -o -name '*.hxx'> cscope.files"
		else
			silent!  execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
		endif
		silent! execute "!cscope -bq"
		if filereadable("cscope.out")
			execute "cs add cscope.out"
		endif
	endif
	silent! execute "!ctags -R"
endfunction
map <F12> <ESC>:call Do_CsTag()<CR>//以后按F12就可以对一个工程进行tags索引建立并且引入了
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>   
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


au FileType php setlocal dict+=~/.vim/dict/phpfunclist.txt
let g:pydiction_location='~/.vim/ftplugin/pydiction/complete-dict'
autocmd FileType c set omnifunc=ccomplete#Complete
