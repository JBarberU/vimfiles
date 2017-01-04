" vim: foldmethod=marker

" General stuff/one-offs {{{1
set encoding=utf-8
set number
set foldcolumn=1
set showcmd " show incomplete portion of cmd eg. 100gg
set scrolloff=999

" Swap files {{{1
set noswapfile
set nobackup
set nowritebackup

" Searching {{{1
set hlsearch
set showmatch
set incsearch

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

" Auto completion {{{1
set wildmenu
set wildmode=list:longest,full
set ignorecase
set smartcase
set wildignore+=*.o,*.obj,*.pyc,*.pdf,*.so,*.hi,*swp,*/build/*,*.git/*,CMakeLists\.txt\.*

" Auto-reload vimrc {{{1
" if has('autocmd')
"     autocmd bufwritepost vimrc source $MYVIMRC
" endif

" Plugins {{{1


if has('gui_running')
    let g:vim_dir=$HOME.'/vimfiles'
else
    " Enable colors for terminal mode
    set t_Co=16

    let g:vim_dir=$HOME.'/.vim'
endif

execute plug#begin(g:vim_dir . '/plugged')

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

" Plugin Settings {{{1
let NERDTreeIgnore = ["\.pyc", "\.so$", "\.a$", "build/*", "CMakeLists\.txt\..*"]
let NERDTreeShowHidden=1

let g:UltiSnipsSnippetDirectories=[g:vim_dir."/UltiSnips", $HOME."/.UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234 ctermfg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236 ctermfg=240

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

let g:pymode_rope_autoimport = 0
let g:pymode_rope = 0

if has("unix")
    let g:clang_library_path="/usr/lib/llvm-3.5/lib/"
endif

" Theme {{{1
syntax enable
set background=dark
colorscheme koehler

" airline statusbar
let g:airline_powerline_fonts=1
set laststatus=2

" Folds
hi Folded ctermbg=234 ctermfg=213 guibg=#1F1F1F guifg=#F787FF
hi FoldColumn ctermbg=0 ctermfg=213 guibg=black guifg=#F787FF

" Show whitespace characters
set listchars=tab:\>\ ,eol:$,trail:~
set list
hi NonText ctermfg=237 guifg=#3F3F3F

" Set all SpecialKey colors to yellow on red (to get trailing whitespace to
" really pop). We'll fix prepending SpecialKeys with indent_guides later
hi SpecialKey ctermfg=237 guifg=#3F3F3F

" Make Visual use the same highlight colors as CursorLine
hi! link Visual CursorLine

" Page Width {{{1
execute "set colorcolumn=" . join(range(81,82), '|')
hi ColorColumn ctermfg=237 guifg=#3F3F3F

" Cursor {{{1
function! HighlightLine()
    hi CursorLine ctermbg=235 cterm=None guibg=#3F3F3F
endfunction

function! UnHighlightLine()
    hi CursorLine ctermbg=235 cterm=None guibg=#2F2F2F
endfunction

au InsertEnter * call HighlightLine()
au InsertLeave * call UnHighlightLine()
set cursorline
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

" Run current python script with venv
if has('gui_running')
    nnoremap <silent> ,,r :w !call venv\Scripts\activate.bat & python -<CR><CR>
else
    nnoremap <silent> ,,r :w !source venv/bin/activate && python -<CR><CR>
endif
