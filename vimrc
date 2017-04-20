" vim: foldmethod=marker

" General stuff/one-offs {{{1
set encoding=utf-8
set number
set foldcolumn=1
set showcmd " show incomplete portion of cmd eg. 100gg
set scrolloff=999
set path+=**

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

Plug 'powerline/fonts'
Plug 'Lokaltog/vim-easymotion'
Plug 'docunext/closetag.vim'
Plug 'scrooloose/syntastic'
Plug 'JBarberU/vim-diffsaved'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/upAndDown' " Move code blocks
Plug 'tpope/vim-abolish' " Smarter substitution
Plug 'godlygeek/tabular' " Text alignment
Plug 'tpope/vim-fugitive' " Git
Plug 'nelstrom/vim-visual-star-search' " Ability to search from visual selection with * or #
Plug 'JBarberU/vim-local' " Load .vimrc_local

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'JBarberU/xterm-color-table.vim', { 'on': 'XtermColorTable' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }

" Haskell {{{2
Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'wlangstroth/vim-haskell', { 'for': 'haskell' }
Plug 'dag/vim2hs', { 'for': 'haskell' }

" C++ {{{2
Plug 'Rip-Rip/clang_complete', { 'for': 'cpp' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'vim-scripts/c.vim', { 'for': 'cpp' }
" 	# Jump between hpp/cpp
Plug 'vim-scripts/a.vim', { 'for': 'cpp' }

" 	HTML {{{2
Plug 'pbrisbin/html-template-syntax', { 'for': 'html' }

" 	Markdown {{{2
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" 	Rust {{{2
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" 	Python {{{2
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'klen/python-mode', { 'for': 'python' }

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

" Custom commands {{{1

command! EditVimrc :tabedit $MYVIMRC
command! EditGVimrc :tabedit $MYGVIMRC
command! SourceVimrc :source $MYVIMRC

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

" Copy/paste into/from system clipboard
nnoremap <c-c> "*
vnoremap <c-c> "*

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>p :find<space>
nnoremap <leader><leader>p :b<space>

" Run current python script with venv
if has('gui_running')
    nnoremap <silent> ,,r :w !call venv\Scripts\activate.bat & python -<CR><CR>
else
    nnoremap ,,r :w !source venv/bin/activate && python -<CR>
endif

let g:secret_vimrc = fnameescape(g:vim_dir . '/secret_vimrc')
if filereadable(g:secret_vimrc)
    execute 'source ' . g:secret_vimrc
endif

" Tab edits
nnoremap <C-w><C-t> :tabnew<CR>
nnoremap <C-w><C-p> :tabnew<CR>:file unsaved_buffer.py<CR>:filetype detect<CR>
nnoremap <C-w><C-e> :tabedit<SPACE>

" Open and editing vimrc
nnoremap <C-w><C-v> :tabedit $MYVIMRC<CR>

" Refactor word under cursor
nnoremap ,ref yiw:%s/<C-r>0//gc<left><left><left>
