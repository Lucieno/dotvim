" Enables highlight syntax
syntax enable
autocmd BUfNewFile,BufReadPost *.tpp set filetype=c++
autocmd BUfNewFile,BufReadPost *.pl set filetype=prolog
"set foldenable

" Sweet colorscheme
colorscheme lucius
" colorscheme hybrid
set background=dark
set guifont=Monaco:h12

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set foldenable

set number
set cursorline
set so=5

" No backup file
set nobackup
set nowritebackup
set noswapfile
 
" No more annoying sounds
set visualbell

set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set incsearch     " show search matches as you type
set expandtab
set shiftwidth=4
set softtabstop=4

set history=1000         " remember more commands and search history
set undolevels=1000      " use many levels of undo

" Tabs in command line mode behave like bash
set wildmode=longest,list,full
set wildmenu
 
" Highlight the entire word when searching for it
set hlsearch

" Move line by line even when the line is wrapped
map j gj
map k gk
 
" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Setup Bundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
nnoremap <silent> <F2> :NERDTree<CR>
map <Leader>nt :NERDTree %:p:h<CR>

Plugin 'junegunn/fzf'

Plugin 'mattn/emmet-vim'

Plugin 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2 

Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=/data/misc/software/misc./vim/stdcpp.tags
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_invoke_completion = '<M-;>'
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
let g:ycm_always_populate_location_list = 1
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'ruby': 1
      \}

Plugin 'adimit/prolog.vim'

Plugin 'suan/vim-instant-markdown'
set shell=bash\ -i

call vundle#end()
filetype plugin indent on


