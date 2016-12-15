" vim: foldmethod=marker

set encoding=utf-8
set number
set foldcolumn=1

" Sane tabs {{{1
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set showbreak=...
set modeline
set modelines=5
set backspace=indent,eol,start

" Plugins {{{1
execute plug#begin('~/vimfiles/plugged')

" General {{{2

Plug 'https://github.com/powerline/fonts.git'
Plug 'https://github.com/Lokaltog/vim-easymotion.git'
Plug 'https://github.com/docunext/closetag.vim.git'
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'https://github.com/JBarberU/vim-diffsaved.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tmhedberg/SimpylFold'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/vim-scripts/upAndDown' " Move code blocks  
Plug 'https://github.com/tpope/vim-abolish.git' " Smarter substitution
Plug 'https://github.com/godlygeek/tabular.git' " Text alignment
Plug 'https://github.com/tpope/vim-fugitive.git' " Git
Plug 'https://github.com/nelstrom/vim-visual-star-search.git' " Ability to search from visual selection with * or #
Plug 'https://github.com/JBarberU/vim-local.git' " Load .vimrc_local

Plug 'https://github.com/scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git', { 'on': ['CtrlP', 'CtrlPClearAllCaches'] }
Plug 'https://github.com/JBarberU/xterm-color-table.vim.git', { 'on': 'XtermColorTable' }
Plug 'https://github.com/mileszs/ack.vim.git', { 'on': 'Ack' }

" Haskell {{{2
Plug 'https://github.com/lukerandall/haskellmode-vim.git', { 'for': 'haskell' }
Plug 'https://github.com/eagletmt/ghcmod-vim.git', { 'for': 'haskell' }
Plug 'https://github.com/wlangstroth/vim-haskell.git', { 'for': 'haskell' }
Plug 'https://github.com/dag/vim2hs.git', { 'for': 'haskell' }

" C++ {{{2
Plug 'https://github.com/Rip-Rip/clang_complete.git', { 'for': 'cpp' }
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git', { 'for': 'cpp' }
Plug 'https://github.com/vim-scripts/c.vim.git', { 'for': 'cpp' }
" 	# Jump between hpp/cpp
Plug 'https://github.com/vim-scripts/a.vim', { 'for': 'cpp' }

" 	HTML {{{2
Plug 'https://github.com/pbrisbin/html-template-syntax.git', { 'for': 'html' }

" 	Markdown {{{2
Plug 'https://github.com/tpope/vim-markdown.git', { 'for': 'markdown' }

" 	Rust {{{2
Plug 'https://github.com/rust-lang/rust.vim.git', { 'for': 'rust' }

" 	Python {{{2
Plug 'https://github.com/davidhalter/jedi-vim.git', { 'for': 'python' }
Plug 'https://github.com/klen/python-mode.git', { 'for': 'python' }

execute plug#end()

" Theme {{{1
colorscheme koehler
let g:airline_powerline_fonts=1
set laststatus=2
hi Folded ctermbg=237 cterm=None guibg=#1F1F1F guifg=#F787FF
hi FoldColumn ctermbg=black cterm=None guibg=black guifg=#F787FF
"hi FoldColumn ctermbg=235 cterm=None guibg=#3F3F3F guifg=#999999

" Cursor {{{1
function! HighlightLine()
    hi CursorLine ctermbg=235 cterm=None guibg=#3F3F3F
endfunction

function! UnHighlightLine()
    hi CursorLine ctermbg=235 cterm=None guibg=#2F2F2F
endfunction

au InsertEnter * call HighlightLine()
au InsertLeave * call UnHighlightLine()
set cul
call UnHighlightLine()
set concealcursor=inv
set conceallevel=2
set nostartofline

" Keyboard shortcuts {{{1
noremap <up>    <nop>
noremap <down>  <nop>
noremap <left>  <nop>
noremap <right> <nop>

inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

inoremap <C-l> <ESC>
let mapleader=","
nnoremap <silent> ,/ :nohlsearch<CR>
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<CR>
nnoremap <c-c> :q<CR>

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap ,p :CtrlP<CR>
nnoremap ,,p :CtrlPClearAllCaches<CR>

