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
"set mouse=a
set tabstop=4
set clipboard=unnamedplus
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
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

map <C-m> :call Mouse_toggle()<cr>
function! Mouse_toggle()
    if &mouse =='a'
        set mouse=
    else
        set mouse=a
    endif
endfunction
