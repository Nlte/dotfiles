" Source before the colorscheme activation in the vimrc file
"

let s:nord0 = "#2E3440"
let s:nord1 = "#3B4252"
let s:nord2 = "#434C5E"
let s:nord3 = "#4C566A"
let s:nord3_bright = "#616E88"
let s:nord4 = "#D8DEE9"
let s:nord5 = "#E5E9F0"
let s:nord6 = "#ECEFF4"
let s:nord7 = "#8FBCBB"
let s:nord8 = "#88C0D0"
let s:nord9 = "#81A1C1"
let s:nord10 = "#5E81AC"
let s:nord11 = "#BF616A"
let s:nord12 = "#D08770"
let s:nord13 = "#EBCB8B"
let s:nord14 = "#A3BE8C"
let s:nord15 = "#B48EAD"

function! CustomHighlight() abort

    " """"""""""""""""""""
    " python
    " """"""""""""""""""""
    highlight pythonClassVar ctermfg=red guifg=#BF616A
    highlight pythonStatement ctermfg=blue guifg=#4C566A
    highlight pythonStrFormatting ctermfg=yellow guifg=#EBCB8B

    " """"""""""""""""""""
    " C++
    " """"""""""""""""""""
    highlight cppSTLconstant ctermfg=lightcyan guifg=#88C0D0
    highlight cppStructure ctermfg=blue guifg=#4C566A
    highlight cppAccess ctermfg=magenta guifg=s:nord15
    highlight cIncluded ctermfg=green guifg=s:nord14


endfunction


augroup nord-theme-overrides

	autocmd!
    autocmd ColorScheme nord call CustomHighlight()

augroup END
