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
Plug 'skywind3000/asyncrun.vim'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'mhinz/vim-signify'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'altercation/vim-colors-solarized'
Plug 'powerline/powerline'
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

" powerline
" 将字体设置为Meslo LG S DZ Regular for Powerline 13号大小
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h13

let g:Powerline_symbols = 'fancy'       " Powerline_symbols为状态栏中的箭头，unicode没有箭头
"let g:Powerline_symbols= 'unicode'
"
set  rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
set laststatus=2                " 必须设置为2,否则状态栏不显示
set t_Co=256                    " 开启256颜色之后，colorschema在vim里好看了许多
let g:Powerline_colorscheme='solarized256'  " 状态栏使用了solarized256配色方案

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"IDE
"---------------------
" plug - ale.vim
"---------------------
"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1

" self-define statusline
"function! LinterStatus() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"
"    return l:counts.total == 0 ? 'OK' : printf(
"    \  '%dW %dE',
"    \  all_non_errors,
"    \  all_errors
"    \)
"endfunction
"set statusline=%{LinterStatus()}

" echo message
" %s is the error message itself
" %linter% is the linter name
" %severity is the severity type
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" use quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" only enable these linters
"let g:ale_linters = {
"\    'javascript': ['eslint']
"\}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)

" run lint only on saving a file
" let g:ale_lint_on_text_changed = 'never'
" dont run lint on opening a file
" let g:ale_lint_on_enter = 0

"------END ale.vim--------
"YCM
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers = {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ "markdown":1,
			\ }

let g:ycm_filetype_blacklist = {'notes': 1, 'unite': 1, 'tagbar': 1, 'pandoc': 1, 'qf': 1, 'vimwiki': 1, 'text': 1, 'infolog': 1, 'mail': 1}

"c++
" asyncrun.vim
"自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
"任务结束时候响铃提醒
let g:asyncrun_bell = 1
"设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"设置 F9 为编译单文件
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"按 F5 运行
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>



"vimrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
