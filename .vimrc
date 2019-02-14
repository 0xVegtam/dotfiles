" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic settings to provide a solid base for code editting
" don't make vim compatible with vi 
set nocompatible

"Enables syntax highlighting
:syntax on

"Enables line numbers on side
:set nu

"highlight the last used search pattern.
set hlsearch

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

"Enables omnicompletion
set omnifunc=syntaxcomplete#Complete

" When coding, auto-indent by 4 spaces, just like in K&R
" Note that this does NOT change tab into 4 spaces
" You can do that with "set tabstop=4"
set shiftwidth=4

" Always replace tab with 8 spaces, except for makefiles
"set expandtab
" reload files changed outside vim
set autoread         

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8


" set unix line endings
set fileformat=unix

" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos


autocmd FileType make setlocal noexpandtab

" Ignore case when searching
" - override this setting by tacking on \c or \C to your search term to make
"   your search always case-insensitive or case-sensitive, respectively.
set ignorecase

"Set the max line length at 80 characters
set textwidth=80


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"Improves vim lag - any action that is not typed will not cause the screen to redraw.
set lazyredraw

"Tells vim that the terminal is able to handle having more characters sent to the screen for redrawing.
set ttyfast

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif
" Don't do spell-checking on Vim help files
autocmd FileType help setlocal nospell

" Prepend ~/.backup to backupdir so that Vim will look for that directory
" before littering the current dir with backups.
set backupdir^=~/.backup
" Also use ~/.backup for swap files. The trailing // tells Vim to incorporate
" full path into swap file names.
set dir^=~/.backup//
" Ignore case when searching
" - override this setting by tacking on \c or \C to your search term to make
"   your search always case-insensitive or case-sensitive, respectively.
set ignorecase
"Disable vi backspace setings so all characters can be backspaced not just the
"ones that were entered during that insert session
set backspace=2


filetype plugin indent on
"Python file settings
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
"Turn a tab into 4 spaces when working with python files
au FileType py set tabstop=4
"Text file settings 
"Only turn on spell checking when in a txt file
au FileType txt set spell
"Stop syntastic from operating on python files
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
set cindent


" ---------------------- PLUGIN CONFIGURATION ----------------------
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle - required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
"Plugin 'vimwiki/vimwiki'
Plugin 'Raimondi/delimitMate'
Plugin 'itchyny/lightline.vim'
Plugin 'klen/python-mode'
Plugin 'junegunn/fzf'
Plugin 'tpope/vim-eunuch'
Plugin 'mips.vim'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'skalnik/vim-vroom'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'chriskempson/base16-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tell-k/vim-autopep8'
Plugin 'fatih/vim-go'
Plugin 'wincent/command-t'
"Themes
Plugin 'rakr/vim-one'
Plugin 'altercation/vim-colors-solarized'
Plugin 'TroyFletcher/vim-colors-synthwave'
Plugin 'nightsense/carbonized'


Plugin 'vim-latex/vim-latex'
" -- IntelliJ IDE communication - for Android Studio
Plugin 'dhleong/intellivim'

" -- Web Development
Plugin 'Shutnik/jshint2.vim'        
Plugin 'mattn/emmet-vim'            
Plugin 'kchmck/vim-coffee-script'   
Plugin 'groenewege/vim-less'        
Plugin 'skammer/vim-css-color'      
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'digitaltoad/vim-jade'   
Plugin 'elzr/vim-json'

" -- Devops 
Plugin 'hashivim/vim-terraform'
Plugin 'juliosueiras/vim-terraform-completion'

" -- All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


" -- Terraform config
let g:terraform_align=1
let g:terraform_fmt_on_save=1


" -- Go config
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1

" -- Go linter config
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"For Soarized Theme
"let g:solarized_termcolors=256
"colorscheme synthwave
set background=dark

"Remap the escape key functionality to jj. This was done because of the macbook
"touchbar
inoremap jj <ESC>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
