"===============
"=== 基础配置 ==
"===============

let mapleader= ' ' " 设置 LEADER 键为空格键
let &t_ut=''       " 使配色更加兼容你的终端

syntax on          " 语法高亮
set nocompatible   " 不兼容vi
set mouse=a        " 支持使用鼠标



"================
"=== 主题配置 ===
"================
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1

"colorscheme base16-default-dark
"colorscheme snazzy 
"colorscheme janah
colorscheme molokai



"================
"=== 编码配置 ===
"================
set encoding=utf-8      " 使用utf-8编码
set termencoding=utf-8  " 设置终端使用的编码方式



"================
"=== 编辑配置 ===
"================
set laststatus=2        " 是否显示状态栏：0 不显示 ｜ 1 多窗口时显示 ｜ 2 显示
set number              " 显示行号
set relativenumber      " 相对行号
set cursorcolumn        " 光标竖线
set cursorline          " 光标横线
set showcmd             " 命令模式下，显示键入的指令
set wildmenu            " 命令模式提示，按tab 唤起提示
set nowrap              " 关闭自动折行
set scrolloff=5         " 垂直滚动时，光标距离顶部/底部的行数
set sidescrolloff=5     " 水平滚动时，光标距离行首/行尾的字符数
set clipboard=unnamed
set autowrite           " 切换其他缓冲区时自动保存修改过的缓冲区
set cindent
set smartindent         "设置新增行时进行智能缩进，主要用于 C 语言一族，与 cindent 选项类似
"set linebreak          " 单词不会被折行，与 set wrap 一起用
"set wrap               " 自动折行
set backspace=2         " 能使用 backspace 删除
set backspace=indent,eol,start " 退格键到行首后自动跳转到上行行尾

" >> 设置缩进距离
    set expandtab           " tab 转为空格
    set tabstop=4           " 设定 tab 长度为 4
    set shiftwidth =4       " 设定 << 和 >> 命令移动时的宽度为 4
    set softtabstop=4       " 使得按退格键时可以一次删掉 4 个空格


" >> 设置折叠
    "set foldenable         " 开启折叠
    "set foldmethod=syntax  " 设置语法折叠
    "set foldcolumn=0       " 设置折叠区域的宽度
    "setlocal foldlevel=1   " 设置折叠层数为
    "set foldclose=all     " 设置为自动关闭折叠 

" >> 设置空格的显示
    "set list
    "set lcs=tab:▸\ ,trail:・,nbsp:+
    set tw=0
    set indentexpr=

" >> 光标样式
    " 1 -> blinking block         闪烁的方块
    " 2 -> solid block            不闪烁的方块
    " 3 -> blinking underscore    闪烁的下划线
    " 4 -> solid underscore       不闪烁的下划线
    " 5 -> blinking vertical bar  闪烁的竖线
    " 6 -> solid vertical bar     不闪烁的竖线
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"    " 插入模式：细线
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"    " 替换模式：下划线
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"    " 正常模式：粗线

">>  记住上次浏览位置
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" vim执行的外部命令会在当前目录下执行
    set autochdir



"================
"=== 搜索设置 ===
"================

set ignorecase     " 忽略大小写搜索
set smartcase      " 智能忽略大小写
set hlsearch	   " 搜索高亮
set incsearch      " 实时搜索高亮

" 跳到下一个搜索目标
noremap = nzz
" 跳到上一个搜索目标
noremap - Nzz
" 取消高亮
noremap <LEADER>/ :nohlsearch<CR>

"设置这个这样每次打开才不会继续高亮上次搜索的内容
exec "nohlsearch"



"====================
"=== 文件类型设置 ===
"====================

filetype on                " 启用文件类型检查
filetype indent on         " 指定 Vim 为不同类型的文件定义不同的缩进格式
filetype plugin on         " 用于 Vim 打开加载文件类型插件功能
filetype plugin indent on





"===========================
"===========================
"======== 插件安装 =========
"===========================
"===========================

map PI :PlugInstall<CR>
map CI :CocInstall

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'           " 状态条
Plug 'vim-airline/vim-airline-themes'    " 状态条主题
Plug 'chriskempson/base16-vim'           " base16 主题
Plug 'connorholyday/vim-snazzy'          " snazzy 主题
Plug 'fatih/molokai'                     " molokai 主题

" Git
Plug 'tpope/vim-fugitive'                " airline 依赖的 git branch 显示
Plug 'airblade/vim-gitgutter'

" File navigation 换成 coc-explorer 了。
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'

" coc.nvim
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Taglist
Plug 'liuchengxu/vista.vim'

" 浮动终端
Plug 'voldikss/vim-floaterm'

" Golang
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tab': '*' }
Plug 'majutsushi/tagbar'

" 注释与反注释
"Plug 'preservim/nerdcommenter'
"Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'

" 自动格式化
" Plug 'Chiel92/vim-autoformat'

" 欢迎页
Plug 'mhinz/vim-startify'

" 快速跳转， n 模式下按 ss 激活
Plug 'easymotion/vim-easymotion'

" 程序检错
Plug 'dense-analysis/ale'

Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" 成对输入括号
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" 彩色括号
Plug 'luochen1990/rainbow'

" 快速生成代码
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 标记功能增强
Plug 'kshenoy/vim-signature'
" mx 创建/撤销标记‘x’,并且在最左边一列展示
" dmx 删除x
" m/ 打开标记窗口
" m<Space> 删除所有标记
" ]` 跳到下一个标记
" [` 跳到上一个标记

" 颜色预览
Plug 'ap/vim-css-color'

call plug#end()



"====================
"=== VIM 插件配置 ===
"====================

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

" < Rainbow 彩色括号 > ------ {
    let g:rainbow_active = 1
" }

" < vim-go > ------ {
    let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
    let g:go_autodetect_gopath = 1
    let g:go_list_type = "quickfix"
    let g:go_imports_autosave = 1
    " let g:go_version_warning = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_build_constraints = 1
    let g:godef_split=2
    let g:go_version_warning = 0

    "  打开面板，搜索后跳转至定义处，Go to Definition
    " Open :GoDeclsDir with ctrl-g
    autocmd FileType go nmap <C-g> :GoDeclsDir<CR>
    autocmd FileType go imap <C-g> <ESC>:<C-u>GoDeclsDir<CR>

    " 显示当前标识符的详情
    " Open :GoDoc with ctrl-k
    let g:go_doc_keywordprg_enabled = 0
    autocmd FileType go nmap <C-k> :GoDoc<CR>
    autocmd FileType go imap <C-k> <ESC>:GoDoc<CR>
   
    " 显示当前标识符的定义
    autocmd FileType go nmap <Leader>o <Plug>(go-info)
    let g:go_auto_type_info = 1     " 自动显示当前标识符定义
                           
    " 编辑时格式化 Ctrl+l 
    autocmd FileType go imap <C-l> <ESC>:GoFmt<CR>h

    augroup go
      autocmd!
      autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
    augroup END

    " build_go_files is a custom function that builds or compiles the test file.
    " It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
    function! s:build_go_files()
      let l:file = expand('%')
      if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
      elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
      endif
    endfunction


    " Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
    " quickfix window with <leader>a
    "map <C-n> :cnext<CR>
    "map <C-m> :cprevious<CR>
    "nnoremap <leader>a :cclose<CR>

" }


" < fzf 设置 > ------ {
    map <leader>f :Files<CR>
    map <leader>b :Buffers<CR>
    let g:fzf_action = { 'ctrl-e': 'edit' }
    " 用 leader+ag 搜索当前 cursor 下单词 see: https://github.com/junegunn/fzf.vim/issues/50
    nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
" }

" < tagbar 大纲视图 > ------ {
    nmap <LEADER><F8> :TagbarToggle<CR>
" }


" < vim-easymotion > ------ {
    nmap ss <Plug>(easymotion-s2)
" }

" < Snippets 代码段 > ------ {
    let g:UltiSnipsExpandTrigger = "<M-TAB>"
" }

" < Vista.vim > ------ {
    " >> 基础设置
        noremap <LEADER>V :silent! Vista finder coc<CR>
        noremap <LEADER>v :Vista!!<CR>

    " >> UI 设置
        let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
        let g:vista_default_executive = 'coc'
        let g:vista_fzf_preview = ['right:50%']
        let g:vista#renderer#enable_icon = 1
        let g:scrollstatus_size = 15
        let g:vista#renderer#icons = {
        \   "function": "\uf794",
        \   "variable": "\uf71b",
        \  }
" }


" < ale 程序检错 > ------ {
    let g:ale_set_highlights = 1
    let g:ale_set_quickfix = 1

    "自定义error和warning图标
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚡'
    
    "在vim自带的状态栏中整合ale
    let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
    
    "显示Linter名称,出错或警告等相关信息
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    
    "打开文件时不进行检查
    let g:ale_lint_on_enter = 1

    "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
    nmap sp <Plug>(ale_previous_wrap)
    nmap sn <Plug>(ale_next_wrap)
    
    "<Leader>s触发/关闭语法检查
    " nmap <Leader>l :ALEToggle<CR>
    "<Leader>d查看错误或警告的详细信息
    nmap <Leader>d :ALEDetail<CR>
    
    let g:ale_linters = {
        \ 'go': ['golint', 'go vet', 'go fmt'],
        \ 'python': ['flake8', 'pylint'],
        \ 'rust': ['cargo'],
        \ }

" }


" < Floaterm 浮动终端 > ------ {
    " >> 基础设置

        let g:floaterm_autoclose=1

        nnoremap   <silent>  <F5>    :FloatermShow<CR>
        nnoremap   <silent>  <F6>    :FloatermHide<CR>
        tnoremap   <silent>  <F5>    <C-\><C-n>:FloatermShow<CR>
        tnoremap   <silent>  <F6>    <C-\><C-n>:FloatermHide<CR>

        nnoremap   <silent>  <F7>    :FloatermNew<CR>
        nnoremap   <silent>  <F8>    :FloatermFirst<CR>
        nnoremap   <silent>  <F9>    :FloatermPrev<CR>
        nnoremap   <silent>  <F10>   :FloatermNext<CR>
        nnoremap   <silent>  <F11>   :FloatermLast<CR>
        nnoremap   <silent>  <F12>   :FloatermKill<CR>
        tnoremap   <silent>  <F7>    <C-\><C-n>:FloatermNew<CR>
        tnoremap   <silent>  <F8>    <C-\><C-n>:FloatermFirst<CR>
        tnoremap   <silent>  <F9>    <C-\><C-n>:FloatermPrev<CR>
        tnoremap   <silent>  <F10>   <C-\><C-n>:FloatermNext<CR>
        tnoremap   <silent>  <F11>   <C-\><C-n>:FloatermLast<CR>
        tnoremap   <silent>  <F12>   <C-\><C-n>:FloatermKill<CR>

        nnoremap   <silent>   <F1>   :FloatermToggle<CR>
        tnoremap   <silent>   <F1>   <C-\><C-n>:FloatermToggle<CR>

        nnoremap   <silent>   <M-p>   :FloatermNew python<CR>
        nnoremap   <silent>   <M-r>   :FloatermNew --height=0.8 --width=0.8 ranger<CR>
" }


" < airline 状态栏美化 > ------ {
    " >> 基础设置
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1   " 是否打开tabline
        let g:airline#extensions#tabline#buffer_nr_show = 1 " 是否显示 Buffer 编号
        "let g:airline_theme='light'

    " >> 所有符号设置
        if !exists('g:airline_symbols')
            let g:airline_symbols={}
        endif
        " unicode symbols
        "let g:airline_symbols.maxlinenr = '☰ '
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.colnr = '|:'
        let g:airline_symbols.linenr = ':'
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.maxlinenr = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.dirty='⚡'

    " >> mode 简写
        let g:airline_mode_map = {
            \ '__'     : '-',
            \ 'c'      : 'C',
            \ 'i'      : 'I',
            \ 'ic'     : 'I',
            \ 'ix'     : 'I',
            \ 'n'      : 'N',
            \ 'multi'  : 'M',
            \ 'ni'     : 'N',
            \ 'no'     : 'N',
            \ 'R'      : 'R',
            \ 'Rv'     : 'R',
            \ 's'      : 'S',
            \ 'S'      : 'S',
            \ ''     : 'S',
            \ 't'      : 'T',
            \ 'v'      : 'V',
            \ 'V'      : 'V',
            \ ''     : 'V',
            \ }

    " >> section 设置
        let g:airline_section_c = '%{expand("%")}'  " 显示文件名
        "let g:airline_section_y = fileencoding
        let g:airline_section_z = airline#section#create(['linenr', 'colnr'])
        let g:airline_section_warning = ''
" }


" < NERDTree 文件管理器 > ------ {

    " >> 在目录树中的基本操作 (按 ? 可以打开帮助页面)
        " q 关闭 NERDTree
        " o 在已有窗口中打开文件或目录，并将光标跳到该窗口
        " O 递归打开选中 结点下的所有目录
        " x 合拢选中结点的父目录
        " X 递归 合拢选中结点下的所有目录
        " P 跳到根结点
        " p 跳到父结点
        "
        " u 设置上级目录为根路径
        " U 设置上级目录为跟路径，但是维持原来目录打开的状态
        " r 刷新光标所在的目录
        " R 刷新当前根路径
        " I 显示或者不显示隐藏文件
        " f 打开和关闭文件过滤器
        " A 全屏显示 NERDTree，或者关闭全屏
        " C 将根路径设置为光标所在的目录

    " >> 基础设置
        "map <C-b> :NERDTreeToggle<CR>

        "Change current folder as root
        "let g:NERDTreeChDirMode = 2

        " Exit Vim if NERDTree is the only window remaining in the only tab.
        "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " >> UI 设置
        "let g:NERDTreeHidden=1            " 1 to Don't show hidden files, 0 to show
        "let NERDTreeQuitOnOpen=1          " Close NERDtree when files was opened
        "let NERDTreeMinimalUI=1           " Start NERDTree in minimal UI mode (No help lines)
        "let NERDTreeDirArrows=1           " Display arrows instead of ascii art in NERDTree
        "let NERDTreeChDirMode=2           " Change current working directory based on root directory in NERDTree
        "let NERDTreeWinSize=30            " Initial NERDTree width
        "let NERDTreeAutoDeleteBuffer = 1  " Auto delete buffer deleted with NerdTree
        ""let NERDTreeShowBookmarks=0      " Show NERDTree bookmarks
        ""let g:NERDTreeShowLineNumbers=1  " Show Line Number

        "" Customize icons on Nerdtree
        "let g:NERDTreeDirArrowExpandable = '▸'
        "let g:NERDTreeDirArrowCollapsible = '▾'

        "let NERDTreeOpenVSplit = ""
        "let NERDTreeMapOpenExpl = ""
        "let NERDTreeMapOpenInTab = "o"
        "let NERDTreeMapOpenSplit = ""
        "let NERDTreeMapCloseDir = "n"
        "let NERDTreeMapActivateNode = "i"
        "let NERDTreeMapUpdir = ""
        "let NERDTreeMapUpdirKeepOpen = "l"
        "let NERDTreeMapPreview = ""
        "let NERDTreeMapChangeRoot = "y"

        "let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__']   " Hide temp files in NERDTree

        "" Open Nerdtree when there's no file opened
        ""autocmd vimenter * if !argc()|NERDTree|endif

        "" Or, auto-open Nerdtree
        ""autocmd vimenter * NERDTree

        "" Close NERDTree when there's no other windows
        "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " >> NERDTree-git
        "let g:NERDTreeIndicatorMapCustom = {
        "    \ "Modified"  : "✹",
        "    \ "Staged"    : "✚",
        "    \ "Untracked" : "✭",
        "    \ "Renamed"   : "➜",
        "    \ "Unmerged"  : "═",
        "    \ "Deleted"   : "✖",
        "    \ "Dirty"     : "✗",
        "    \ "Clean"     : "✔︎",
        "    \ 'Ignored'   : '☒',
        "    \ "Unknown"   : "?"
        "    \ }
" }


" < vim-startify 欢迎页 > ------ {
    let g:startify_files_number = 5
    let g:startify_session_autoload = 1
    let g:startify_custom_header = [
       \' ╭──────────────────────────────────────────────────╮',
       \' │                                                  │ ',
       \' │  ███╗   ███╗██████╗    ██████╗  ██████╗ ██╗██╗   │ ',
       \' │  ████╗ ████║██╔══██╗   ██╔══██╗██╔═══██╗██║██║   │ ',
       \' │  ██╔████╔██║██████╔╝   ██████╔╝██║   ██║██║██║   │ ',
       \' │  ██║╚██╔╝██║██╔══██╗   ██╔══██╗██║   ██║██║██║   │ ',
       \' │  ██║ ╚═╝ ██║██║  ██║██╗██████╔╝╚██████╔╝██║██║   │ ',
       \' │  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═════╝  ╚═════╝ ╚═╝╚═╝   │ ',
       \' │                                                  │ ',
       \' │                               Show Me The Code.  │ ',
       \' ╰──────────────────────────────────────────────────╯ ',
       \]
" }


"====================
"=== coc 插件配置 ===
"====================

" >> 全局加载的插件的列表
    let g:coc_global_extensions = [
        \ 'coc-json',
        \ 'coc-vimlsp']


    set hidden          " 设置这个，才能在未保存的情况下跳转别的文件
    set updatetime=100  " 每次启动会更新，设置越少越省时间
    set shortmess+=c    " 补全的时候底下信息栏显示的简洁点

" >> 代码提示的时候，按 Tab 选中第一个候选结果，再按 Tab 选中第二个...
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <S-TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" >> 按 Alt+/ 主动调出提示
    inoremap <silent><expr> <a-/> coc#refresh()

" >> 回车选中第一个提示
    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" >> 跳到上/下一个报错的地方
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

" >> 代码导航.
    " 跳到变量定义的地方
    nmap <silent> gd <Plug>(coc-definition)
    " 跳到类型定义的地方
    nmap <silent> gy <Plug>(coc-type-definition)
    " 跳到实现的地方
    nmap <silent> gi <Plug>(coc-implementation)
    " 跳到引用的地方
    nmap <silent> gr <Plug>(coc-references)

" >> 使用空格加h 显示文档
    " Use <LEADER>h to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

" >> 批量重命名
    nmap <F2> <Plug>(coc-rename)

" >> 文件浏览器
    let g:coc_explorer_global_presets = {
        \   '.vim': {
        \     'root-uri': '~/.vim',
        \   },
        \   'cocConfig': {
        \      'root-uri': '~/.config/coc',
        \   },
        \   'tab': {
        \     'position': 'tab',
        \     'quit-on-open': v:true,
        \   },
        \   'tab:$': {
        \     'position': 'tab:$',
        \     'quit-on-open': v:true,
        \   },
        \   'floating': {
        \     'position': 'floating',
        \     'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingTop': {
        \     'position': 'floating',
        \     'floating-position': 'center-top',
        \     'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingLeftside': {
        \     'position': 'floating',
        \     'floating-position': 'left-center',
        \     'floating-width': 50,
        \     'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingRightside': {
        \     'position': 'floating',
        \     'floating-position': 'right-center',
        \     'floating-width': 50,
        \     'open-action-strategy': 'sourceWindow',
        \   },
        \   'simplify': {
        \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
        \   },
        \   'buffer': {
        \     'sources': [{'name': 'buffer', 'expand': v:true}]
        \   },
        \ }

    nmap <C-b>   <Cmd>CocCommand explorer<CR>
    " Use preset argument to open it
    nmap <space>ed <Cmd>CocCommand explorer --preset .config<CR>
    nmap <space>ef <Cmd>CocCommand explorer --preset floating<CR>
    nmap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
    nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>
    " 最后一个文件关闭后，coc-explorer 也跟着关闭
    autocmd BufEnter * if (winnr('$') == 1 && &filetype == 'coc-explorer') | q | endif
   




"================
"=== 按键映射 ===
"================

" :help key-notation 查看全部映射

" noremap 非递归，默认都是递归的
" nmap 在普通模式下生效
" vmap 在可视模式下生效
" imap 在插入模式下生效
" cmap 在ex命令模式下生效
"
" <k0>-<k9>  小键盘数字0到9
" <S-x>      大写S配合x，意味着shift+x组合键
" <C-x>      大写C配合x，意味着ctrl+x组合键
" <A-x>      大写A配合x，意味着alt+x组合键
" <D-x>      大写D配合x，意味着command+x组合键
" <M-x>      大写M配合x，意味着meta+x组合键
" <ESC>      ESC键
" <BS>       backspace退格键
" <CR>       ENTER回车键
" <Space>    空格键
" <Shift>    shift键
" <Ctrl>     ctrl键
" <Alt>      alt键
" <Meta>     meta键
" <D>        command键
" <F1>-<F12> F1到F12功能键
" <up>       方向键上 ⬆️
" <down>     方向键下 ⬇️
" <left>     方向键左 ⬅️
" <right>    方向键右 ➡️


" Insert
noremap h i
noremap H I

" Direction key
"     ^
"     i
" < j   l >
"     k
"     v
nnoremap i k
nnoremap k j
nnoremap j h
nnoremap l l
nnoremap I 10k
nnoremap K 10j
nnoremap J 10h
nnoremap L 10l

nnoremap <S-Up> 10k
nnoremap <S-Down> 10j
nnoremap <S-Left> 10h
nnoremap <S-Right> 10l


" 跳到绝对行首
"noremap 8 0
" 跳到行首
"noremap 9 ^
" 跳到行尾
"noremap 0 $


" Save & Quit & take effect
map S :w<CR>
map s <nop>
map Q :q<CR>
map QQ :q!<CR>
map R :source $MYVIMRC<CR>
" Disable the default s key
noremap s <nop>
" Normal 下 Tab 莫名其妙会变成 :m-2，所以改掉
nnoremap <TAB> 4l 

" 反撤销
map U <C-r>
inoremap <D-z> <ESC>uh 


" 分屏
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sl :set splitright<CR>:vsplit<CR>
map sk :set splitbelow<CR>:split<CR>
" 切换窗口
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K
" 调整窗口大小
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize+5<CR>
map <LEADER><right> :vertical resize-5<CR>
" 分页
map tn :tabe<CR>
map t- :-tabnext<CR>
map t= :+tabnext<CR>
map td :tabclose<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <ESC>:tabnew<CR>
noremap t1 1gt
noremap t2 2gt
noremap t3 3gt
noremap t4 4gt
noremap t5 5gt
noremap t6 6gt
noremap t7 7gt
noremap t8 8gt
noremap t9 9gt

" 缓冲区
"
" :ls 列出缓冲区
"     标志含义
"     u	列表外缓冲区 unlisted-buffer。
"     %	当前缓冲区。	 	 
"     #	轮换缓冲区。	 	 
"     a	激活缓冲区,缓冲区被加载且显示。	 	 
"     h	隐藏缓冲区,缓冲区被加载但不显示。	 	 
"     =	只读缓冲区。	 	 
"     -	不可改缓冲区, ’modifiable’ 选项不置位。	 	 
"     +	已修改缓冲区。
"
" 多 buffer 查找替换
"     :bufdo %s/{pattern}/{replace}/ge | update

map bn :enew<CR>       " 打开一个新的 Buffer
map b- :bprevious<CR>  " 切换上一个 Buffer
map b= :bnext<CR>      " 切换下一个 Buffer
map bd :bd!<CR>        " 关闭 Buffer 而不退出 vim
noremap b1 :b 1<CR> 
noremap b2 :b 2<CR>
noremap b3 :b 3<CR>
noremap b4 :b 4<CR>
noremap b5 :b 5<CR>
noremap b6 :b 6<CR>
noremap b7 :b 7<CR>
noremap b8 :b 8<CR>
noremap b9 :b 9<CR>


" 移动行和复制行
" >> on Linux
    "vnoremap <A-Up>     :m-2<CR>
    "vnoremap <A-Down>   :m+<CR>
    "vnoremap <A-S-Up>   yyip
    "vnoremap <A-S-Down> yyp
    "
    "nnoremap <A-Up>     :m-2<CR>
    "nnoremap <A-Down>   :m+<CR>
    "nnoremap <A-S-Up>   yyip
    "nnoremap <A-S-Down> yyp
    "
    "inoremap <A-Up>     <ESC>:m-2<CR>
    "inoremap <A-Down>   <ESC>:m+<CR>
    "inoremap <A-S-Up>   <ESC>yyip
    "inoremap <A-S-Down> <ESC>yyp

" >> on Mac
    vnoremap <M-Up>     :m-2<CR>
    vnoremap <M-Down>   :m+<CR>
    vnoremap <M-S-Up>   yyip
    vnoremap <M-S-Down> yyp
    
    nnoremap <M-Up>     :m-2<CR>
    nnoremap <M-Down>   :m+<CR>
    nnoremap <M-S-Up>   yyip
    nnoremap <M-S-Down> yyp
    
    inoremap <M-Up>     <ESC>:m-2<CR>
    inoremap <M-Down>   <ESC>:m+<CR>
    inoremap <M-S-Up>   <ESC>yyip
    inoremap <M-S-Down> <ESC>yyp
    
noremap ; :



" ================
" === Vim 配置 ===
" ================

" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif


" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun


" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber


" 普通模式下 <CTRL-n> 切换相对行号或绝对行号
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>


"设置跳出自动补全的括号
func SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}' || getline('.')[col('.') - 1] == '`' 
        return "\<ESC>la"  
    else  
        return "\t"  
    endif  
endfunc  
" 将tab键绑定为跳出括号  
inoremap <TAB> <c-r>=SkipPair()<CR>

" ==================
" === 优秀配置参考 ===
" ==================
" [详细说明配置，自定义较多] https://wklken.me/posts/2016/02/03/some-vim-configs.html
" [纯净 vim-go 配置] https://www.amistyrain.com/post/2020/07/25/neovim/
