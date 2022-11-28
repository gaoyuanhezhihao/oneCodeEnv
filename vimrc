set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
"Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'xolox/vim-misc'
Plugin 'preservim/tagbar'
Plugin 'brookhong/cscope.vim'
Plugin 'morhetz/gruvbox'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'mrtazz/DoxygenToolkit.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'justinmk/vim-sneak'
Plugin 'svermeulen/vim-easyclip'
Plugin 'tpope/vim-repeat'
"Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'skywind3000/gutentags_plus'
Plugin 'rhysd/vim-clang-format'
Plugin 'neoclide/coc.nvim'
"Plugin 'jackguo380/vim-lsp-cxx-highlight'
"Plugin 'bagrat/vim-buffet'
Plugin 'webdevel/tabulous'
Plugin 'tpope/vim-obsession.git'
Plugin 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
"Plugin 'davidhalter/jedi-vim'
"Plugin 'pacha/vem-tabline'
Plugin 'dominikduda/vim_current_word'
call vundle#end()
filetype on
source ~/.vim/basic.vim
source ~/.vim/color.vim
"source ~/.vim/plugin_config/vim-header.vim
"define <Leader>
"SimpylFold
let g:SimpylFold_docstring_preview=1
"Flagging unnecessary whitespace
syntax on
set softtabstop=2
set tabstop=2
set et
set shiftwidth=2
set expandtab
    "\ set shiftwidth=4
    "\ set textwidth=79
    "\ set expandtab
    "\ set autoindent
    "\ set fileformat=unix
"YouCompleteMe
"youcompleteme  默认tab  s-tab 和自动补全冲突
" make YCM compatible with UltiSnips (using supertab)
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 1
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("/home/zhihaohe/software/clang+llvm-13.0.0-x86_64-linux-gnu-ubuntu-16.04/bin/clangd")
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_filepath_completion_use_working_dir=1

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
set completeopt-=preview
" disable shows documentation in a popup at the cursor location.
let g:ycm_auto_hover=""
" show documentation manually
nmap <leader>D <plug>(YCMHover)
"---Syntastic---
let g:syntastic_check_on_open = 1
hi SpellBad ctermfg=088 guifg=#870000 guibg=#080808
hi SpellCap ctermfg=190 guifg=#dfff00 guibg=#080808
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['cpplint']
" 设置 cpplint 的错误级别阈值（默认是 5），级别低于这一设置的不会显示
let g:syntastic_cpp_cpplint_thres = 0
let syntastic_aggregate_errors = 1
"===Syntastic===
"设置跳转的快捷键，可以跳转到definition和declaration
"nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_show_diagnostics_ui = 0
let python_highlight_all=1
"if has('gui_running')
"colorscheme solarized
"else
"	colorscheme zenburn
"endif
call togglebg#map("<F5>")
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
"  --- basic config ---
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set clipboard+=unnamed
set nu
set relativenumber
function! NumberToggle()
    echo &relativenumber
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set number
        set relativenumber
    endif
endfunc

nnoremap <F2> :call NumberToggle()<cr>
imap <F2> :call NumberToggle()<cr>
"  === basic config ===


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
    cs add ../cscope.out
elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
endif
"cs add ~/study/c_cpp/stl/SGI/stl/cscope.out
let g:cscope_silent=1
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
"nmap <F8> :TagbarToggle<CR>
nmap <Leader>t :TagbarOpenAutoClose<CR>
"  ===tagbar===
"  ---easytag--
set tags+=./tags;../tags
set tags+=/home/hzh/oneCodeEnv/vim/tags/tags
let g:easytags_dynamic_files=1
"  ===easytag==
"  --- EasyMotion ---
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
"  === EasyMotion ===

""  --- CtrlP ---
"let g:ctrlp_use_caching = 0
"if executable('ag')
    "set grepprg=ag\ --nogroup\ --nocolor

    "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"else
  "let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  "let g:ctrlp_prompt_mappings = {
    "\ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    "\ }
"endif
""  === CtrlP ===

"  --- eregex ---
let g:eregex_forward_delim = '<Space>/'
"  === eregex ===
"  --- sneak ---
let g:sneak#s_next = 1
"nmap f <Plug>Sneak_f
"nmap t <Plug>Sneak_F
"  === sneak ===
"  --- easyclip---

"  === easyclip===
"  --- bookmarks ---
nmap <Leader>fm  <Plug>BookmarkToggle
nmap <Leader>fi <Plug>BookmarkAnnotate
nmap <Leader>fa <Plug>BookmarkShowAll
nmap <Leader>fj <Plug>BookmarkNext
nmap <Leader>fk <Plug>BookmarkPrev
nmap <Leader>mc <Plug>BookmarkClear
nmap <Leader>mx <Plug>BookmarkClearAll
nmap <Leader>mu <Plug>BookmarkMoveUp
nmap <Leader>md <Plug>BookmarkMoveDown
nmap <Leader>mg <Plug>BookmarkMoveToLine
"  === bookmarks ===
"  --- airline ---
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline#extensions#clock#format='%H:%M'
"let g:airline#extensions#clock#updatetime=1000
set noshowmode
let g:airline_theme='sol'
"let g:airline#extensions#whitespace#checks = [ 'indent' ]
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_setion_gutter=''
let g:airline#extensions#csv#enabled = 0
"disable git status
let g:airline_section_b = 0
let g:airline_section_y = 0
let g:airline_section_z = 0

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tagline#formatter = 'unique_tail'

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''
let g:airline#extensions#tagbar#searchmethod = 'scoped-stl'

"let g:airline_setion_y='%t'
"let g:airline_setion_z='%t'
"  === airline ===
"
"
"
"
"  --- lightline ---
"let g:lightline = {
      "\ 'colorscheme': 'PaperColor_dark',
      "\ 'component': {
      "\   'modified': '%#ModifiedColor#%{LightlineModified()}',
      "\ },
      "\ }

"function! LightlineModified()
  "let map = { 'V': 'n', "\<C-v>": 'n', 's': 'n', 'v': 'n', "\<C-s>": 'n', 'c': 'n', 'R': 'n'}
  "let mode = get(map, mode()[0], mode()[0])
  "let bgcolor = {'n': [240, '#585858'], 'i': [31, '#0087af']}
  "let color = get(bgcolor, mode, bgcolor.n)
  "exe printf('hi ModifiedColor ctermfg=196 ctermbg=%d guifg=#ff0000 guibg=%s term=bold cterm=bold',
        "\ color[0], color[1])
  "return &modified ? '+++++' : &modifiable ? '' : '-'
"endfunction

"let g:lightline = { 'component': {'relativepath': '%#MyRelativePathColor#%{MyRelativePath()}' }}

"function! MyRelativePath()
"let map = { 'V': 'n', "\<C-v>": 'n', 's': 'n', 'v': 'n', "\<C-s>": 'n', 'c': 'n', 'R': 'n'}
"let mode = get(map, mode()[0], mode()[0])
"let bgcolor = {'n': [240, '#585858'], 'i': [31, '#0087af']}
"let color = get(bgcolor, mode, bgcolor.n)
"if &modified
"exe printf('hi MyRelativePathColor ctermfg=196 ctermbg=%d guifg=#ff0000 guibg=%s term=bold cterm=bold', color[0], color[1])
"endif
"return expand('%:t')
"endfunction
"  === lightline ===
"
"
"
"
"
"  --- gtags ---
" enable gtags module
let g:gutentags_modules = ['gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope = 1

let g:gutentags_plus_nomap = 1
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gD :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>
"  === gtags ===

"  --- clang-format ---
let g:clang_format#detect_style_file = 1
let g:clang_format#command = '/home/zhihaohe/.local/bin/clang-format'
let g:clang_format#enable_fallback_style = 0 " clang-format does nothing when .clang-format is not founded.
let g:clang_format#auto_format = 1 " inserted lines are automatically formatted on leaving insert mode.
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" call clang-format manually
map <C-w> :pyf $HOME/oneCodeEnv/vim/clang-format.py<cr>
imap <C-I> <c-o>:pyf $HOME/oneCodeEnv/vim/clang-format.py<cr>

" --- vim-lsp-cxx-highlight ---
let g:lsp_cxx_hl_use_text_props = 0
let g:lsp_cxx_hl_log_file = "/tmp/lsp_cxx_hl.log"
" --- vim-buffet ---
"noremap <Tab> :bn<CR>
"noremap <S-Tab> :bp<CR>
"noremap <Leader><Tab> :Bw<CR>
"noremap <Leader><S-Tab> :Bw!<CR>
"noremap <C-t> :tabnew split<CR>

nnoremap <leader>1 :1tabnext<CR>
nnoremap <leader>2 :2tabnext<CR>
nnoremap <leader>3 :3tabnext<CR>
nnoremap <leader>4 :4tabnext<CR>
nnoremap <leader>5 :5tabnext<CR>
nnoremap <leader>6 :6tabnext<CR>
nnoremap <leader>7 :7tabnext<CR>
nnoremap <leader>8 :8tabnext<CR>
nnoremap <leader>9 :9tabnext<CR>

" --- tabulous ---
let tabulousLabelNameOptions = ':t'


" --- vem-tabline ---
"nmap <leader>h <Plug>vem_move_buffer_left-
"nmap <leader>l <Plug>vem_move_buffer_right-
"nmap gT <Plug>vem_prev_buffer-
"nmap gt <Plug>vem_next_buffer-
" --- coc.nvim ---
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_default_semantic_highlight_groups = 1
" DarkSlateGray3
hi CocSemProperty ctermfg=195 guifg=#83a598 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE 
" SteelBlue1
hi CocSemParameter ctermfg=75 guifg=#005f00 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE 
" Steel Blue
hi CocSemVariable ctermfg=67 guifg=#005f00 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE 

" == coc.nvim ===
" --- vim_current_word ---
hi CurrentWord ctermbg=16 cterm=bold
hi CurrentWordTwins ctermbg=237
" === vim_current_word ===
