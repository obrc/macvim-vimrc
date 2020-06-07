"使用vim-plugin
call plug#begin()
"# 完整的GitHub仓库地址
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"# 简写形式，只写username/repo即可
"Plug 'junegunn/fzf'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'wookayin/vim-typora'
Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug '907th/vim-auto-save'
call plug#end()

"设置主题
colorscheme gruvbox
"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"显示行号
set number
"显示括号匹配
set showmatch
"设置Tab长度为4空格
set tabstop=4
"设置自动缩进长度为4空格
set shiftwidth=4
"继承前一行的缩进方式，适用于多行注释
set autoindent
"设置粘贴模式
set paste
"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"打开文件类型检测
filetype plugin indent on

"editor
let g:vim_markdown_math = 1 "高亮 latex 数学公式
let g:auto_save = 1  " enable AutoSave on Vim startup

"vimrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

