" 打开行号
set number
" 设置命令历史记录条数
set history=200
" 关闭兼容vi
set nocompatible
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 模式搜索实时预览,增量搜索
set incsearch
" 复制时同时将文本复制到系统剪贴板, 使用这个命令需要安装vim-gnome (sudo apt install vim-gnome)
set clipboard=unnamedplus
" 设置搜索高亮
set hlsearch
" 设置paste快捷键--在粘贴外部代码时需要开启paste防止粘贴后出现连续缩进，粘贴完成时需要关闭
set pastetoggle=<F4>
" 忽略大小写 (该命令配合smartcase使用较好，否则不要开启)
set ignorecase
" 模式查找时智能忽略大小写
set smartcase
" vim自身命令行模式智能补全
set wildmenu
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 禁止折行
set nowrap
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=8
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" 修正回退键不起作用的问题
set backspace=indent,eol,start

" 代码缩进对齐线
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" 开启标签跳转匹配 如 if-end
" runtime maros/matchit.vim

" 配色方案
" 新版的vim除了安装以下几个主题插件外还需要手动复制主题文件到colors文件夹下，执行的命令如下
" cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
" 如果没有~/.vim/colors文件夹，则需要手动创建
" set background=dark
" colorscheme solarized
colorscheme molokai
"colorscheme phd

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5

" 设置代码模板文件
let g:UltiSnipsSnippetDirectories=["mysnippets"] 
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" 键盘映射区 begin

" 定义一个前缀键,即<Leader>
let mapleader=";"
" 暂时取消搜索高亮快捷键
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" 前一个缓冲区
nnoremap <silent> [b :w<CR>:bprevious<CR>
" 后一个缓冲区
nnoremap <silent> ]b :w<CR>:bnext<CR>
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>t :TagbarToggle<CR> 
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
" 定义快捷键到行首和行尾
nmap LB 0
nmap lb ^
nmap le $
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存并退出当前窗口
nmap <Leader>wq :wq<CR>
" 定义快捷键保存并退出当前所有窗口
nmap <Leader>wqa :wqa<CR>
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>s :FSHere<cr>
" 键盘映射区 end

" vundle 环境设置 begin
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
"vundle 环境配置 end
" 自适应不同的语言的智能缩进
filetype plugin indent on



" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" def begin
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()   
" def end
