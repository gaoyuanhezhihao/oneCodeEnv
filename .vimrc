set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpyFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()


filetype plugin indent on
"split navigations
nnoremap <C-K> <C-W><C-J>
nnoremap <C-I> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-H>
"Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za
"SimpylFold
let g:SimpylFold_docstring_preview=1
"Flagging unnecessary whitespace
"set encoding = utf-8
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
"YouCompleteMe
"youcompleteme  默认tab  s-tab 和自动补全冲突

let g:ycm_key_list_select_completion = ['<Tab>']
let g:ycm_key_list_previous_completion = ['<Up>']
"" 
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tag_files = 1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_key_invoke_completion = '<C-/>'
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
"force recomile with syntastic
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" 
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"设置error和warning的提示符，如果没有设置，ycm会以syntastic的g:syntastic_warning_symbol
"和 g:syntastic_error_symbol 这两个为准
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
"设置跳转的快捷键，可以跳转到definition和declaration
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
syntax on
"if has('gui_running')
set background=dark
let g:solarized_termcolors=256
"colorscheme solarized
"else
"	colorscheme zenburn
"endif
call togglebg#map("<F5>")
set nu
set clipboard=unnamed
" nerdtree
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>


