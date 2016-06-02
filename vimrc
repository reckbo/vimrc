set nocompatible  " be iMproved
filetype off
" ********************************************************************
" Fugitive
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'gmarik/Vundle.vim' " required!

""" Coding
Plugin 'plasticboy/vim-markdown'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive' " git
Plugin 'gitv'
Plugin 'MarcWeber/vim-addon-mw-utils' "required by vim-snipmate
Plugin 'tomtom/tlib_vim' "required by vim-snipmate
Plugin 'garbas/vim-snipmate'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/vimproc.vim'
""" Files
Plugin 'will133/vim-dirdiff'
Plugin 'The-NERD-tree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ack.vim'
Plugin 'nerdtree-ack'
""" Navigation
Plugin 'easymotion/vim-easymotion'
Plugin 'matchit.zip'
""" Editing
Plugin 'ervandew/supertab'
Plugin 'Tabular'
Plugin 'The-NERD-Commenter'
Plugin 'tpope/vim-surround'
Plugin 'repeat.vim'
"Plugin 'paredit.vim' " lisp syntax
""" Vimoutliner
"Plugin 'vimoutliner'
"Plugin 'vimoutliner-colorscheme-fix'
""" Look
Plugin 'jpo/vim-railscasts-theme'
Plugin 'molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rdark-terminal'
Plugin 'rdark'
Plugin 'Zenburn'
Plugin 'reckbo/haskell-syntax.vim'
Plugin 'vim-scripts/wombat256.vim'

filetype plugin indent on

" ********************************************************************
" Settings
"set clipboard=unnamedplus,autoselect
set wildmode=longest,list,full
set wildmenu
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set completeopt=menuone,menu,longest
set showmode
"let mapleader = ","
"let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","
set showmatch
set t_Co=256
set cmdheight=1
hi LineNr guifg=#333333
set ai " Automatically set the indent of a new line (local to buffer)
set copyindent
set cursorline
set cursorcolumn
""" Scrollbars 
set sidescrolloff=2
set numberwidth=4
""" Windows 
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright
"" Searching 
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
nmap <silent> ,/ :nohlsearch<CR>
""" Colors 
"set t_Co=256 " 256 colors
set background=dark
syntax on " syntax highlighting
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"colorscheme solarized
colorscheme jellybeans
""" Status Line
set showcmd
set ruler " Show ruler
""" Line Wrapping 
set nowrap
set linebreak  " Wrap at word
""" Misc
set nobackup
set noswapfile
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
""" File Types
"augroup SetCMS
    "autocmd FileType votl let &l:commentstring=": %s"
"augroup END
"autocmd BufEnter *.* lcd %:p:h " Sets path to directory buffer was loaded from
autocmd FileType mkd :set nofoldenable
autocmd BufWritePre *.py :%s/\s\+$//e
au BufNewFile,BufRead *.md set filetype=mkd
au BufNewFile,BufRead *.do set filetype=sh
au BufNewFile,BufRead *.gradle set filetype=groovy
au BufNewFile,BufRead *.j set filetype=j
autocmd! bufwritepost .vimrc source ~/.vimrc
""" Omni Completion 
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete " May require ruby compiled in
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
""" SuperTab 
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 0
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 1
let g:haskellmode_completion_ghc = 1
""" NERDTree
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything
let NERDTreeWinSize=40
let NERDTreeBookmarksFile="/tmp/.NERDtreebookmarks"
let NERDTreeShowBookmarks=1
""" Tabular
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
""" Ctrl-p
map <silent> <Leader>p :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
""" ghc-mod
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
""" Syntastic
"map <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ********************************************************************
" Shortcuts
nnoremap b :ls<CR>:b<Space>
nnoremap <space> 10jzz
nnoremap <backspace> 10kzz
"nmap <leader><leader>w :w!<cr>
"""Window and neovim terminal
"nmap <leader>w <c-w>
"tnoremap <Esc> <C-\><C-n>
"tnoremap <c-h> <C-\><C-n><C-w>h
"tnoremap <c-j> <C-\><C-n><C-w>j
"tnoremap <c-k> <C-\><C-n><C-w>k
"tnoremap <c-l> <C-\><C-n><C-w>l
nmap <c-h> <C-w>h
nmap <c-j> <C-w>j
nmap <c-k> <C-w>k
nmap <c-l> <C-w>l
"
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
nmap <leader><leader>q :q!<cr>
nmap <leader>x :close<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc<cr>
:nmap <c-n><c-n> :set invnumber <cr>
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>
nnoremap <leader>; :
nnoremap <leader>1 :!
":nnoremap <leader><leader>d "=strftime("%a %d %b %Y %H:%M:%S")<CR>P
":inoremap <leader><leader>d <C-R>=strftime("%a %d %b %Y %H:%M:%S")<CR>
:nnoremap <leader><leader>d "=strftime("%Y-%m-%d %H:%M")<CR>P
:inoremap <leader><leader>d <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
"Vertical split then hop to new buffer
:noremap ,V :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>
imap jj <Esc>
vnoremap ;; <ESC>
imap uu _
imap hh =>
imap aa @
map <S-Enter> o<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge
nmap [l :lnext<cr>
nmap ]l :lprevious<cr>
nmap [c :cnext<cr>
nmap ]c :cprevious<cr>
""" Misc
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how
set mouse=a " Enable the mouse
""" Invisible characters 
set listchars=trail:.,tab:>-,eol:$
"set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars
""" NERDTree
:noremap ,n :NERDTreeToggle<CR>
""" TagBar  
nnoremap <leader>t :TagbarToggle<CR>
"""easy motion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0
nmap s <Plug>(easymotion-s)
"nmap s <Plug>(easymotion-overwin-f)
nmap t <Plug>(easymotion-t2)
let g:EasyMotion_smartcase = 1

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2

" ************************************************************************
" Tabs 
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

" ************************************************************************
" haskell for tagbar
if executable('lushtags')
    let g:tagbar_type_haskell = {
            \ 'ctagsbin' : 'lushtags',
            \ 'ctagsargs' : '--ignore-parse-error --',
            \ 'kinds' : [
                \ 'm:module:0',
                \ 'e:exports:1',
                \ 'i:imports:1',
                \ 't:declarations:0',
                \ 'd:declarations:1',
                \ 'n:declarations:1',
                \ 'f:functions:0',
                \ 'c:constructors:0'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
                \ 'd' : 'data',
                \ 'n' : 'newtype',
                \ 'c' : 'constructor',
                \ 't' : 'type'
            \ },
            \ 'scope2kind' : {
                \ 'data' : 'd',
                \ 'newtype' : 'n',
                \ 'constructor' : 'c',
                \ 'type' : 't'
            \ }
        \ }
endif
