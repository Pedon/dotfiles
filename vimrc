" Author: Sarp Orgul
" File: .vimrc
" ------------------
" Vim Settings

set nocompatible

" automatically install vimplugged if not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" neovim specific configuration
if has("nvim")
   " ....
endif

" colorsheme
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

" vim interface
Plug 'vim-airline/vim-airline' "airline bar
Plug 'vim-airline/vim-airline-themes'

" Async completion framewor
Plug 'maralla/completor.vim'

" Table creation ez
Plug 'dhruvasagar/vim-table-mode'

" undo
Plug 'sjl/gundo.vim' "gundo from gir mirror

" fuzzy finding
Plug 'kien/ctrlp.vim' "fuzzy finder
Plug 'tacahiroy/ctrlp-funky' "ctrlp extention to jump to functions

" tim pope is awesome
Plug 'tpope/vim-commentary' "easy commenting
Plug 'tpope/vim-surround' "easy editing surrounding stuff

" code looks good
Plug 'w0rp/ale' "syntax highlighting

" plugin for sml files
Plug 'jez/vim-better-sml' "for comfort in sml

" for better c editing
Plug 'vim-scripts/a.vim' "allows easy switching between header and source files

" git plugins
Plug 'tpope/vim-fugitive' "git commands in vim
Plug 'airblade/vim-gitgutter' "git diff in left bar

" vim tags
Plug 'majutsushi/tagbar' "shows tags from file
Plug 'xolox/vim-misc' "dep for easytags
Plug 'xolox/vim-easytags' "tag generation from files

" prose editing
Plug 'junegunn/goyo.vim' "distraction free mode in vim

" markdown stuff
Plug 'vim-pandoc/vim-pandoc' "for pandoc and markdown in vim
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-markdown' "markdown in vim

" markdown
Plug 'suan/vim-instant-markdown' "markdown preview in vim

" Add plugins to &runtimepath
call plug#end()

" ---------------
" Visual Settings
" ---------------

syntax on
colorscheme gruvbox
let base16colorspace=256
set background=dark
set colorcolumn=80

" sets gruvbox
set t_ZH=[3m
set t_ZR=[23m
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_termcolors=256
let g:gruvbox_underline=1

set encoding=utf8
set lazyredraw
set smartindent
set wrap
syntax enable
set number
set cursorline

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Enable 256 colors
set t_Co=256

" tabs w/ tab char equiv to four spaces
set expandtab
set tabstop=2
set shiftwidth=2

" ------------
" GUI Settings
" ------------

" for getting rid of annoying flashing and beeping
set guioptions-=m
autocmd GUIEnter * set vb t_vb=
autocmd VimEnter * set vb t_vb=

"remove menu bar
set guioptions-=m
"remove toolbar
set guioptions-=T
"remove right-hand scroll bar
set guioptions-=r
"remove left-hand scroll bar
set guioptions-=L
"set gui font
set guifont=Inconsolata\ for\ Powerline\ 12

" keep annoying popups out of the way
autocmd FileChangedRO * echohl WarningMsg | echo "File Changed RO" | echohl None
autocmd FileChangedShell * echohl WarningMsg | echo "File Changed Shell" | echohl None

" put swap files in same dir
set dir=~/.vim/_swap//

" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/_undo/

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/,~/tmp,.

" search settings
set incsearch " search as you type
set hlsearch " highlight search matches
set smartcase
set laststatus=2 " always show status line

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

set tm=500
set autoread
set history=1000
set foldmethod=marker

set undolevels=1000
set backspace=2
set backspace=indent,eol,start
set clipboard^=unnamedplus,unnamed

" bracket matching
set showmatch
set mat=2

" mouse usage
set mouse=n

" ---------------
" Plugin Settings
" ---------------

" Use tab to go through autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_python_binary = '/usr/bin/python3'

" Airline
let g:airline_powerline_fonts=1

if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=racket
    au filetype racket set lisp
    au filetype racket set autoindent
endif

" Gruvbox
" let g:gruvbox_italic=0

" Vim Instant Markdown
let g:instant_markdown_autostart = 0
autocmd FileType markdown nnoremap <C-e> :InstantMarkdownPreview<cr>

" Tagbar default binding tab
nnoremap <C-t> :TagbarToggle<cr>

" Gundo toggle
nnoremap <C-i> :GundoToggle<cr>

" CtrlP
nnoremap <Space> :CtrlP<cr>
nnoremap <leader><Space> :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <leader>f :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" set's ctrlp working directory on startup
let g:ctrlp_working_path_mode = 0
" Sets cache dir for ctrlp (not needed anymore for nvme ssd)
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" Sets ctrlp's search program to ripgrep
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

" vim ignores .git, tmp dirs, and swap files
set wildignore+=*/.git/*,*/tmp/*,*.swp

" ------
" Remaps
" ------

" Run external commands withing vim with this remap
nnoremap Q !!sh<CR>

" remap ; to : in normal mode for entering command mode
noremap ; :

" Arrow Keys BEGONE
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Maps jk to esc
inoremap kj <Esc>
inoremap jk <Esc>
vnoremap kj <Esc>
vnoremap jk <Esc>

" Clear last search
nnoremap <leader>h :let @/ = ""<CR>
inoremap <leader>h <Esc>:let @/ = ""<CR>a

" Ctrl S for save Ctrl G for sudo sav
nnoremap <leader>s :w<CR>
inoremap <leader>s <Esc>:w<CR>a
nnoremap <leader>g :w !sudo tee % > /dev/null<CR>
inoremap <leader>g <Esc>:w !sudo tee % > /dev/null<CR><CR>a

nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" map control-backspace to delete the previous word (only in gvim)
imap <C-BS> <C-W>

" quit vim remap
nnoremap <leader>q :q!<CR>
inoremap <leader>q <Esc>:q!<CR>

" -------------
" Auto Commands
" -------------

" Compiling Remaps Supports (Python,LaTeX,Java,R,sh) TODO: add C, C++ support
set filetype=on

" executes command on file (without the extension)
function CuzJavaIsStupid (command)
   execute "!clear;time " . a:command . " " . expand("%:r")
endfunction

" executes command on file
function RunWith (command)
    execute "w"
    execute "!clear;time " . a:command . " " . expand("%")
endfunction

autocmd FileType tex nnoremap <C-e> :call RunWith("pdflatex")<cr>
autocmd FileType bib nnoremap <C-e> :call RunWith("bibtex")<cr>
autocmd FileType python nnoremap <C-e> :call RunWith("python")<cr>
autocmd FileType java nnoremap <C-e> :call RunWith("javac")<cr><cr>:call CuzJavaIsStupid("java")<cr>
autocmd FileType r nnoremap <C-e> :call RunWith("Rscript")<cr>
autocmd FileType sh nnoremap <C-e> :w<cr>:!./%<cr>
autocmd FileType sml nnoremap <C-e> :w<cr>:call RunWith("rlwrap -c sml")<cr>
autocmd FileType ruby nnoremap <C-e> :w<cr>:call RunWith("ruby")<cr>

" sml comments play nice with commentary
autocmd FileType sml setlocal commentstring=(*%s*)

" tabs w/ tab char equiv to four spaces in java
autocmd FileType java set expandtab
autocmd FileType java set tabstop=4
autocmd FileType java set shiftwidth=4


" for sml syntax conceal
" autocmd FileType sml setlocal conceallevel=2
" let g:sml_greek_tyvar_show_tick = 1

" swap absolute and relative line numbers
function! g:ToggleNuMode()
    if(&rnu == 1)
        set nornu
    else
        set rnu
    endif
endfunc

nnoremap <C-l> :call g:ToggleNuMode()<cr>

" Read-only .doc through antiword
autocmd BufReadPre *.doc silent set ro
autocmd BufReadPost *.doc silent %!antiword "%"

" " Read-only odt/odp through odt2txt
" autocmd BufReadPre *.odt,*.odp silent set ro
" autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"

" Read-only pdf through pdftotext
autocmd BufReadPre *.pdf silent set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78

" " Read-only rtf through unrtf
" autocmd BufReadPre *.rtf silent set ro
" autocmd BufReadPost *.rtf silent %!unrtf --text

autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

"autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout
let g:zipPlugin_ext='*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.xlam,*.xlsx,*.xlsm,*.xlsb,*.xltx,*.xltm,*.xlam,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'
