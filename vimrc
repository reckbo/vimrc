set nocompatible  " be iMproved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()


" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fireplace.git'
Plugin 'tpope/vim-classpath.git'
Plugin 'guns/vim-clojure-static.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'nanotech/jellybeans.vim'
"Plugin 'garbase/vim-snipmate.vim'
"Plugin 'vimoutliner/vimoutliner'
Plugin 'fugitive.vim'  
Plugin 'Align'
Plugin 'rdark-terminal'
Plugin 'rdark'
Plugin 'Zenburn'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'ack.vim'
Plugin 'nerdtree-ack'
Plugin 'vimoutliner'
Plugin 'vimoutliner-colorscheme-fix'
Plugin 'surround.vim'
Plugin 'gitv'
Plugin 'paredit.vim' " lisp syntax
" mappings
Plugin 'unimpaired.vim'
Plugin 'repeat.vim'

filetype plugin indent on     " required!

set wildmode=longest,list,full
set wildmenu
autocmd FileType mkd :set nofoldenable

function! RepeatChar(char, count)
   return repeat(a:char, a:count)
 endfunction
 "nnoremap S :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
 "nnoremap s :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

autocmd BufWritePre *.py :%s/\s\+$//e
au BufNewFile,BufRead *.md set filetype=mkd
augroup SetCMS
    autocmd FileType votl let &l:commentstring=": %s"
augroup END

" Lets you save after you open a file that needs sudo
cmap !! w !sudo tee % >/dev/null

let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","
nnoremap <space> 10jzz
nnoremap <backspace> 10kzz
nmap <leader><leader>w :w!<cr>
nmap <leader>w <c-w>
nmap <leader>q :q<cr>
nmap <leader><leader>q :q!<cr>
nmap <leader>x :close<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"set winheight=9999
"autocmd BufEnter * lcd %:p:h
autocmd! bufwritepost .vimrc source ~/.vimrc
hi LineNr guifg=#333333
:nmap <c-n><c-n> :set invnumber <cr>

nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>
nnoremap <leader>; :
:nnoremap <leader><leader>d "=strftime("%a %d %b %Y %H:%M:%S")<CR>P
:inoremap <leader><leader>d <C-R>=strftime("%a %d %b %Y %H:%M:%S")<CR>

" HTML
" fold tag
nnoremap <leader>ft Vatzf
" sort CSS propertie
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" reselect pasted text
nnoremap <leader>v V`]

set pastetoggle=<F2>

nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc<cr>

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

"nnoremap <C-j> <C-d>
"nnoremap <C-k> <C-u>

set nocompatible
" set relativenumber
" set undofile

nnoremap / /\v
vnoremap / /\v
set gdefault
set showmatch
nnoremap <tab> %
vnoremap <tab> %

" Tabs ************************************************************************
set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  "set noexpandtab
  set expandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

"call Tabstyle_spaces()
call Tabstyle_tabs()


" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
"set si " smartindent	(local to buffer) "Apparently smartindent has been
"replaced by cindent.  Turning this off fixes python's autoindenting that adds
"a tab instead of 4 spaces.
set copyindent


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
:noremap ,V :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>


" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
nmap <silent> ,/ :nohlsearch<CR>


" Colors **********************************************************************
"set t_Co=256 " 256 colors
set background=dark
syntax on " syntax highlighting
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"colorscheme solarized
colorscheme jellybeans


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
"match LongLineWarning '\%120v.*' " Error format when a line is longer than 120


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word


" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap jj <Esc>
"inoremap kj <ESC>
"inoremap jk <ESC>
"inoremap jj <ESC>
vnoremap ;; <ESC>
imap uu _
imap hh =>
imap aa @


" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
set nobackup

" Set Swap directory
"set directory=~/backup/vim/swap
set noswapfile

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h


" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml
"autocmd FileType vo_base :colorscheme vo_dark


" Inser New Line **************************************************************
map <S-Enter> o<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how


" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
"set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars


" Mouse ***********************************************************************
set mouse=a " Enable the mouse
"behave xterm
"set selectmode=mouse


" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge


" Omni Completion *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete



" -----------------------------------------------------------------------------
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------

" VimClojure
" Here's the vimclojure stuff. You'll need to adjust the NailgunClient
" " setting if you're on windows or have other problems.
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME .  "/.vim/lib/vimclojure-nailgun-client/ng"

" Paredit
let g:paredit_mode = 0


" CloseTag  ********************************************************************
" configure CloseTag to only load for html/xml like files
"autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
"autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim


" Fugitive  ********************************************************************
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set previewheight=20


" Sparkup  ********************************************************************
" I don't know yet why sparkup has to be manually sourced
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/sparkup/vim/ftplugin/html/sparkup.vim
"let g:sparkup = "~/.vim/bundle/sparkup/sparkup"
let g:sparkupArgs = '--no-last-newline'
"let g:sparkupExecuteMapping = ''
"let g:sparkupNextMapping = ''
"

" TagBar  ********************************************************************
nnoremap <leader>l :TagbarToggle<CR>


" SuperTab ********************************************************************
let g:SuperTabDefaultCompletionType = "<c-x><c-f>"
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 0
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 1
set completeopt=menu
set completeopt+=longest


" NERDTree ********************************************************************
:noremap ,n :NERDTreeToggle<CR>

" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1

" Single click for everything
let NERDTreeMouseMode=1

let NERDTreeWinSize=40
let NERDTreeBookmarksFile="/tmp/.NERDtreebookmarks"
let NERDTreeShowBookmarks=1



" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2



" -----------------------------------------------------------------------------
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------

" Mac *************************************************************************
"if has("mac")
  ""
"endif

" Windows *********************************************************************
"if has("gui_win32")
  ""
"endif



let g:tagbar_type_clojure = {
    \ 'ctagstype': 'Clojure',
    \ 'kinds' : [
        \ 'n:namespace',
        \ 'd:definitions',
        \ 'f:functions',
        \ 'm:macro',
        \ 'i:inline',
        \ 'a:multimethod definition',
        \ 'b:multimethod instance',
        \ 'c:definition (once)',
        \ 's:struct',
        \ 'v:intern',
    \ ]
    \ }



" -----------------------------------------------------------------------------
" |                               Host specific                               |
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"if hostname() == "foo"
  " do something
"endif

" Example .vimrc.local:

"call Tabstyle_tabs()
"colorscheme ir_dark
"match LongLineWarning '\%120v.*'

"autocmd User ~/git/some_folder/* call Tabstyle_spaces() | let g:force_xhtml=1
