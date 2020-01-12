call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'sheerun/vim-polyglot'
Plug 'vimlab/split-term.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" nord theme overrides (must be called before colorscheme command)
let home = expand('~')
exec 'source' home . '/.config/nvim/nord_additional_syntax.vim'
" nord config
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1


" """"""""""""""""""""""""""
" lightline
" """"""""""""""""""""""""""
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }


" """""""""""""""""""""""""
"  gui
" """"""""""""""""""""""""""
syntax on
colorscheme nord
set number
set guifont=Source\ Code\ Pro:h12
set cursorline
set number
set showcmd
set linespace=3
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set guicursor=
set fileformat=unix
set splitright
set splitbelow
"set signcolumn=yes
"
" """""""""""""""""""""""""
" leader key
" """""""""""""""""""""""""
" change the leader key from "\" to ","
" let mapleader=","

" """""""""""""""""""""""""
" search
" """""""""""""""""""""""""
set incsearch
set hlsearch
set inccommand=nosplit " highlight when in replace mode


" """""""""""""""""""""""""
" file search
" """""""""""""""""""""""""
set path+=**
set wildmenu


" """""""""""""""""""""""""
" Terminal
" """""""""""""""""""""""""
" Remove numbers
au TermOpen * setlocal nonumber norelativenumber

" """""""""""""""""""""""""
" python
" """"""""""""""""""""""""""
let g:python_highlight_all = 1
set wildignore+=*.pyc,*/build/*


" """""""""""""""""""""""""
" c/c++
" """""""""""""""""""""""""
autocmd BufRead,BufNewFile *.tpp set filetype=cpp " set syntax for template implementation
let g:syntastic_cpp_compiler_options = '-std=c++17'


" """""""""""""""""""""""""
" YCM
" """""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
" disable tab and use c-n / c-p
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_max_num_candidates = 10
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
" disable gutter
set signcolumn=no
"let g:ycm_show_diagnostics_ui = 0


" """""""""""""""""""""""""
" Ultisnips
" """""""""""""""""""""""""
let g:UltiSnipsEditSplit = "vertical" 


" """""""""""""""""""""""""
" Colors
" """""""""""""""""""""""""
" Function to inspect keyword type under the cursor
function FuncGetKeywordHighlight()
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction
command! GetKeywordHighlight :call FuncGetKeywordHighlight()

" colortest
function FuncColortest()
    so $VIMRUNTIME/syntax/colortest.vim
endfunction
command! Colortest :call FuncColortest()


" """""""""""""""""""""""""
" Nvim-gdb
" """""""""""""""""""""""""

" """""""""""""""""""""""""
" Tags 
" """""""""""""""""""""""""
set statusline+=%{gutentags#statusline()}

" """""""""""""""""""""""""
" Code folding
" """""""""""""""""""""""""
set foldmethod=indent   
set foldnestmax=10
set foldminlines=0
set nofoldenable
set foldlevel=2
