"---color scheme---
syntax on
syntax enable
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

if &t_Co >= 256 || has("gui_running")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set background=dark
    colorscheme gruvbox
endif

"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
"set background=dark
"colorscheme solarized
"===color scheme===
