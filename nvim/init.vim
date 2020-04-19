
" Plugins
    call plug#begin('~/.local/share/nvim/plugged')

    Plug 'arcticicestudio/nord-vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-clang'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'SirVer/ultisnips'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'mhinz/vim-startify'
    Plug 'kassio/neoterm'
    Plug 'jreybert/vimagit'
    Plug 'dunstontc/projectile.nvim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'sheerun/vim-polyglot'

    call plug#end()

" Nord colors
    let s:nord0 = "#2E3440"
    let s:nord1 = "#3B4252"
    let s:nord2 = "#434C5E"
    let s:nord3 = "#4C566A"
    let s:nord3_bright = "#616E88"
    let s:nord3_brightest = "#7B88A1"
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


" General
    set number
    set encoding=UTF-8
    set guifont="Source Code Pro:h12"
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
    set mouse=a
    set path+=**
    set wildmenu
    set incsearch
    set hlsearch
    set inccommand=nosplit
    let mapleader=" "


" Theme
    " nord theme overrides (must be called before colorscheme command)
    let home = expand('~')
    exec 'source' home . '/.config/nvim/nord_additional_syntax.vim'
    " nord config
    let g:nord_cursor_line_number_background = 1
    let g:nord_uniform_status_lines = 1
    let g:nord_uniform_diff_background = 1
    syntax on
    colorscheme nord
" }}}


" Code folding
    set foldmethod=indent
    set foldnestmax=10
    set foldminlines=0
    set nofoldenable
    set foldlevel=2

" Terminal
    augroup TerminalStuff
        au!
        autocmd TermOpen * setlocal nonumber norelativenumber
    augroup END


" UltiSnips
    let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips/'


" Deoplete
    let g:deoplete#enable_at_startup = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " C/C++
    let g:deoplete#sources#clang#libclang_path='/usr/local/Cellar/llvm/9.0.1/lib/libclang.dylib'
    let g:deoplete#sources#clang#clang_header='/usr/local/Cellar/llvm/9.0.1/include/clang'


" Startify
    let g:startify_custom_header = ['']
    noremap <leader>fp :Startify<CR>


" FzF
    noremap <leader>ff :Files<CR>
    noremap <leader>fb :Buffers<CR>
    noremap <leader>ft :Tags<CR>
    noremap <leader>fhf :History<CR>
    noremap <leader>fhc :History:<CR>
    noremap <leader>fl :Lines<CR>

    let g:fzf_tags_command = 'ctags -R'
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'

    function! s:fzf_statusline()
      " Override statusline as you like
      highlight fzf1 ctermfg=161 ctermbg=251
      highlight fzf2 ctermfg=23 ctermbg=251
      highlight fzf3 ctermfg=237 ctermbg=251
      setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
    endfunction

    autocmd! User FzfStatusLine call <SID>fzf_statusline()
