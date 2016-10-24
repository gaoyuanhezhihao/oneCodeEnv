set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'MattesGroeger/vim-bookmarks'
"Plugin 'tmhedberg/SimpyFold'
"Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jiangmiao/auto-pairs'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'Lokaltog/vim-powerline'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'brookhong/cscope.vim'
Plugin 'morhetz/gruvbox'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'dkprice/vim-easygrep'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
call vundle#end()
filetype on
"define <Leader>
let mapleader=";"
" goto line head/end.
nmap lb 0
nmap le $
" copy selected to system clipboard.
vnoremap <Leader>y "+y
" copy to vim from system clipboard.
nmap <Leader>p "+p
" close current split window.
nmap <Leader>q :q<CR>
" save current windows.
nmap <Leader>w :w<CR>
" go to next window.
nnoremap nw <C-W><C-W>
" go out pairs.
nmap <Leader>pa %
" go to line end in Insert mode.
inoremap <C-l> <Esc>A
set tabstop=4
set clipboard=unnamedplus
filetype plugin indent on

"split navigations
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif
"Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za
set gcr=n:blinkon0
"SimpylFold
let g:SimpylFold_docstring_preview=1
"Flagging unnecessary whitespace
"set encoding = utf-8
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
    "\ set softtabstop=4
    "\ set shiftwidth=4
    "\ set textwidth=79
    "\ set expandtab
    "\ set autoindent
    "\ set fileformat=unix
"YouCompleteMe
"youcompleteme  默认tab  s-tab 和自动补全冲突
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:ycm_key_list_select_completion = ['<Tab>']
"let g:ycm_key_list_previous_completion = ['<S-tab>']
"" 
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_python_binary_path = '/usr/bin/python2.7'
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
"---Syntastic---
hi SpellBad ctermfg=088 guifg=#870000 guibg=#080808
hi SpellCap ctermfg=190 guifg=#dfff00 guibg=#080808
"===Syntastic===
"设置跳转的快捷键，可以跳转到definition和declaration
"nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
syntax on
"if has('gui_running')
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
" nerdcommenter
" comment current line.
" <Leader>cc
" uncomment current line.
" <Leader>cu
" disable arrow key.
" #Powerline
"set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
"---color scheme---
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
if &t_Co >= 256 || has("gui_running")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set background=dark
    colorscheme gruvbox
endif
"===color scheme===

" === 主题 molokai ===
"Plugin 'tomasr/molokai'
" 设置主题 colorscheme molokai
"set background=dark
" === indentLine代码排版缩进标识 ===
"Plugin'Yggdroot/indentLine'
"let g:indentLine_noConcealCursor = 1
"let g:indentLine_color_term = 0
"" 缩进的显示标识|
"let g:indentLine_char = '¦'"
function! AddEmptyLineBelow()
    call append(line("."), "")
endfunction

function! AddEmptyLineAbove()
    let l:scrolloffsave = &scrolloff
    " Avoid jerky scrolling with ^E at top of window
    "   set scrolloff=0
    "     call append(line(".") - 1, "")
    if winline() != winheight(0)
        silent normal! <C-e>
    end
    let &scrolloff = l:scrolloffsave
endfunction

function! DelEmptyLineBelow()
    if line(".") == line("$")
        return
    end
    let l:line = getline(line(".") + 1)
    if l:line =~ '^\s*$'
        let l:colsave = col(".")
        .+1d
        ''
        call cursor(line("."), l:colsave)
    end
endfunction

function! DelEmptyLineAbove()
    if line(".") == 1
        return
    end
    let l:line = getline(line(".") - 1)
    if l:line =~ '^\s*$'
        let l:colsave = col(".")
        .-1d
        silent normal! <C-y>
        call cursor(line("."), l:colsave)
    end
endfunction

function! SetArrowKeysAsTextShifters()
    " normal mode
    nmap <silent> <Left> <<
    nmap <silent> <Right> >>
    nnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>
    nnoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>
    nnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>
    nnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>

    " visual mode
    vmap <silent> <Left> <
    vmap <silent> <Right> >
    vnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>gv
    vnoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>gv
    vnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>gv
    vnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>gv
    " insert mode
    imap <silent> <Left> <C-D>
    imap <silent> <Right> <C-T>
    inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>a
    inoremap <silent> <Down> <Esc>: call AddEmptyLineAbove()<CR>a
    inoremap <silent> <C-Up> <Esc>: call DelEmptyLineBelow()<CR>a
    inoremap <silent> <C-Down> <Esc>: call AddEmptyLineBelow()<CR>a

    "disable modified versions we are not using.
    nnoremap <S-Up> <NOP>
    nnoremap <S-Down> <NOP>
    nnoremap <S-Left> <NOP>
    nnoremap <S-Right> <NOP>

    vnoremap <S-Up> <NOP>
    vnoremap <S-Down> <NOP>
    vnoremap <S-Left> <NOP>
    vnoremap <S-Right> <NOP>

    inoremap <S-Up> <NOP>
    inoremap <S-Down> <NOP>
    inoremap <S-Left> <NOP>
    inoremap <S-Right> <NOP>
endfunction

call SetArrowKeysAsTextShifters()
" #cscope
if filereadable("cscope.out")
    cs add cscope.out
elseif filereadable("../cscope.out")
    cs add ./cscope.out
elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
endif
" s: Find this C symbol
 nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" " g: Find this definition
 nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" " d: Find functions called by this function
 nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" " c: Find functions calling this function
 nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" " t: Find this text string
 nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" " e: Find this egrep pattern
 nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" " f: Find this file
 nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" " i: Find files #including this file
 nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>"

"nmap <Leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
""nmap <Leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <Leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <Leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <Leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <Leader>gf :cs find f <C-R>=expand("<cword>")<CR><CR>
"nmap <Leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>
"nmap <Leader>gj :cn<CR><CR>
"nmap <Leader>gk :cp<CR><CR>
" # make backspace works well
set backspace=indent,eol,start
"  ---tagbar---
nmap <F8> :TagbarToggle<CR>
"  ===tagbar===
"  ---easytag--
set tags+=./tags;../tags
let g:easytags_dynamic_files=1
"  ===easytag==
