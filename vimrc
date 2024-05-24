" vim: foldmethod=marker

" General stuff/one-offs {{{1
set encoding=utf-8
set number
set foldcolumn=1
set showcmd " show incomplete portion of cmd eg. 100gg
set scrolloff=999
set path+=**
let g:netrw_dirhistmax=0


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
set wildignore+=*.o,*.obj,*.pyc,*.pdf,*.so,*.hi,*swp,*.git/*

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
Plug 'tpope/vim-fugitive' "Git for status bar
Plug 'airblade/vim-gitgutter' " Git in editor
Plug 'JBarberU/vim-local' " Load .vimrc_local
Plug 'morhetz/gruvbox' "color theme
Plug 'lambdalisue/suda.vim' "fix for w '!sudo tee %' not working in neovim
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "fuzzy finding of files
Plug 'ilyachur/cmake4vim'
Plug 'markonm/traces.vim' "preview text replacement with :s and friends

"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'JBarberU/xterm-color-table.vim', { 'on': 'XtermColorTable' }
Plug 'mileszs/ack.vim'

" JSON {{{2
Plug 'elzr/vim-json', { 'for': 'json' }

" Haskell {{{2
Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'wlangstroth/vim-haskell', { 'for': 'haskell' }
Plug 'dag/vim2hs', { 'for': 'haskell' }

" C/C++ {{{2
Plug 'ycm-core/YouCompleteMe', { 'for': ['cpp', 'c'] }
"Plug 'Rip-Rip/clang_complete', { 'for': 'cpp' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'vim-scripts/c.vim', { 'for': ['cpp', 'c'] }
" 	# Jump between hpp/cpp
Plug 'vim-scripts/a.vim', { 'for': ['cpp', 'c'] }

" GLSL {{{2
Plug 'beyondmarc/glsl.vim'

" 	HTML {{{2
Plug 'pbrisbin/html-template-syntax', { 'for': 'html' }

" 	Markdown {{{2
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" 	Rust {{{2
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" 	Python {{{2
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'python-mode/python-mode', { 'for': 'python' }

execute plug#end()

" Plugin Settings {{{1
let NERDTreeIgnore = ['\.pyc', '\.so$', '\.a$']
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
let g:pymode_options_colorcolumn = 0
let g:pymode_rope = 0

let g:jedi#force_py_version = 3

if has("unix")
    let g:clang_library_path="/usr/lib/llvm/lib/"
endif

" cmake4vim
let g:cmake_compile_commands = 1
let g:cmake_compile_commands_link = './'
let g:cmake_build_dir_prefix = 'build/'
let g:cmake_reload_after_save = 1
let g:make_arguments = '-j'

" Theme {{{1
syntax enable
set background=dark
colorscheme gruvbox

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
" hi! link Visual CursorLine

" Page Width {{{1
hi ColorColumn ctermbg=200 guibg=#ff00df
call matchadd('ColorColumn', '\%81v', 100)

" Cursor {{{1
function! HighlightLine()
    hi CursorLine ctermbg=238 cterm=None guibg=#444444
endfunction

function! UnHighlightLine()
    hi CursorLine ctermbg=237 cterm=None guibg=#3a3a3a
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
if has("unix")
    command! MakeTags !ctags -R .
else
    command! MakeTags !ctags.exe -R .
endif

command! Cheat execute 'tabedit '.g:vim_dir.'/cheat.md'

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
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<CR>

" Copy/paste into/from system clipboard
set clipboard=unnamed,unnamedplus

nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <leader><C-n> :NERDTreeClose<CR>
nnoremap <leader><C-f> :NERDTreeFind<CR>

" Files plugin
nnoremap <leader>p :Files<CR>

" Search for buffers
nnoremap <leader><leader>p :b<space>

let g:secret_vimrc = fnameescape(g:vim_dir . '/secret_vimrc')
if filereadable(g:secret_vimrc)
    execute 'source ' . g:secret_vimrc
endif

" Tab edits
nnoremap <C-w><C-t> :tabnew<CR>
nnoremap <C-w><C-p> :tabnew<CR>:file unsaved_buffer.py<CR>:filetype detect<CR>
nnoremap <C-w><C-e> :tabedit<SPACE>

" Open and editing vimrc
nnoremap <C-w><C-r> :tabedit $MYVIMRC<CR>

" Refactor word under cursor
nnoremap <leader><C-r> :%s/<C-r><C-w>//gc<left><left><left>

" Send current word to hlsearch
nnoremap <silent> * :let @/ = '<C-r><C-w>'<CR>:set hls<CR>

" Ycm shortcuts
nnoremap <F2> :YcmCompleter GoTo<CR>
nnoremap <F3> :YcmCompleter GoTo
nnoremap <F4> :YcmCompleter GoToAlternateFile<CR>

" cmake4vim shortcuts
nnoremap <leader>T :FZFCMakeSelectTarget<CR>
nnoremap <leader>C :FZFCMakeSelectBuildType<CR>
nnoremap <leader>B :CMakeBuild<CR>
nnoremap <leader>R :CMakeRun<CR>

" Maintain visual mode after shifting indentation
vmap < <gv
vmap > >gv

" Center screen when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" Ack
nnoremap <leader>A :Ack<Space>
vnoremap <leader>A y :Ack <C-R>0<CR>
