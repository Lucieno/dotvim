set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add
" setlocal spell
" bles highlight syntax
syntax enable
autocmd BUfNewFile,BufReadPost *.tpp set filetype=c++
autocmd BUfNewFile,BufReadPost *.pl set filetype=prolog 
autocmd BUfNewFile,BufReadPost *.class set filetype=java
" set foldenable

" Sweet colorscheme
" colorscheme lucius
if !has('nvim')
	colorscheme hybrid
    " colorscheme solarized
	" set background=light
    set background=dark
	set guifont=Monaco:h13
endif

" set spell

" autocmd BufWinLeave *
" autocmd BufWinEnter *.* silent loadview

set noswapfile
" # set backup
" set backupdir=$HOME/Dropbox/tmpfile/vimbackup
" set directory=$HOME/Dropbox/tmpfile/vimswap
" set directory=$HOME/.vim/swap

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set foldenable
set modifiable

set ignorecase

set number
set cursorline
set so=10

set ttymouse=xterm2
set mouse=a

" No backup file
set nobackup
" set nowritebackup
" set noswapfile
 
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

nnoremap <leader>g :tab split<CR>:grep! "\<<cword>\>" . -r<CR>:copen<CR>
nnoremap <Leader>l :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>

set tags=tags;
set autochdir

" source ~/.vim/plugin/cscope_maps.vim

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" Setup Bundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'a.vim'
nmap <C-b> :A<CR>

Plugin 'chrisbra/Recover.vim'

Plugin 'skywind3000/asyncrun.vim'
set shell=zsh
set shellcmdflag=-c

" Plugin 'scrooloose/nerdtree'
" nnoremap <silent> <F2> :NERDTree<CR>

Bundle 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup = 0

"""" Start of FZF

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
nnoremap <C-f> :Files<CR>
" nnoremap <C-e> :Buffers<CR>
" nnoremap <C-f> :Lines<CR>
" nnoremap <C-f> :Rg<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"""" End of FZF

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Plugin 'Konfekt/FastFold'
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" Plugin 'mattn/emmet-vim'

Plugin 'majutsushi/tagbar'
" let g:tagbar_autofocus = 1

" Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2 

Plugin 'mileszs/ack.vim'

" Plugin 'Valloric/YouCompleteMe'
" let g:ycm_server_python_interpreter = 'python'
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_complete_in_comments = 1
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_collect_identifiers_from_tags_files = 1
" " set tags+=/data/misc/software/misc./vim/stdcpp.tags
" " inoremap <leader>; <C-x><C-o>
" set completeopt-=preview
" let g:ycm_min_num_of_chars_for_completion=1
" let g:ycm_cache_omnifunc=1
" let g:ycm_seed_identifiers_with_syntax=1
" let g:ycm_collect_identifiers_from_comments_and_strings = 0
" " let g:ycm_key_invoke_completion = '<M-;>'
" nmap <leader>d :tab split<CR>:YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" nmap <leader>d :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" let g:ycm_always_populate_location_list = 1
" nmap <leader>f :YcmCompleter FixIt<CR>
" nmap <leader>g :lnext<CR>
" " let g:pymode_rope_complete_on_dot = 0
" let g:ycm_filetype_specific_completion_to_disable = {
"       \ 'ruby': 1
"       \}

" Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" Plugin 'lyuts/vim-rtags'

Plugin 'adimit/prolog.vim'

" Plugin 'suan/vim-instant-markdown'
" set shell=bash\ -i

" Plugin 'johngrib/vim-game-code-break'

Plugin 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
xmap <leader>= ga=
xmap <leader>m ga<C-x>\s\\<CR>
xmap <leader>c ga<C-x>\s\/\/<CR>
" nmap <leader>a vipga=vipga<C-x>\s\\<CR>vipga<C-x>\s\/\/<CR>
xmap <leader>a <leader>=<leader>m<leader>c

" Plugin 'lervag/vimtex'
" nmap <localleader>c :w<CR>:AsyncRun -post=AsyncRun\ latexmk\ -c\ %:p latexmk %:p -pdf<CR>
nmap <localleader>c :w<CR>:AsyncRun latexmk %:p -pdf<CR>
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
" if s:extfname ==? "tex"
"   let g:LatexBox_split_type="new"
" endif
"

" Plugin 'vim-latex/vim-latex'
"-----------------latex-------------------------
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
" set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
" filetype indent on

Plugin 'scrooloose/nerdtree'

" Plugin 'xuhdev/vim-latex-live-preview'
" let g:livepreview_previewer = 'open -a Skim'
" autocmd filetype tex setl updatetime=1000

" Plugin 'DoxygenToolkit.vim'
" let g:doxygenToolkit_authorName="Lucien"
" let g:doxygenToolkit_briefTag_funcName="yes"
" nmap <leader>a :Dox<CR>

" Plugin 'tomlion/vim-solidity'

Plugin 'rbgrouleff/bclose.vim'
" Plugin 'francoiscabrol/ranger.vim'

Plugin 'blueyed/vim-diminactive'

" Plugin 'fatih/vim-go'
Plugin 'sebdah/vim-delve'

call vundle#end()
filetype plugin indent on

nmap <leader>s :source ~/.vimrc<CR>
nmap <leader>, :tabe ~/.vimrc<CR>

" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <S-z> :ZoomToggle<CR>

" nmap <C-n> :NERDTreeToggle<CR>
" nmap <C-n> :NERDTreeTabsToggle<CR>
nmap <C-n> :NERDTreeTabsToggle<CR>
nmap <C-m> :TagbarToggle<CR> 
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>
nmap <C-j> zj
nmap <C-k> zk
nmap <C-a> <Home>
nmap <C-e> <End>
nmap <C-d> :q<CR>
nmap <C-s> :w<CR>
nmap <C-t> :tabe<CR>
autocmd VimEnter * nmap <C-t> :tabe<CR>
nmap <C-y> yiw
nmap <C-p> viwp
nmap <C-\> :vsp<CR>
nmap <C-_> :sp<CR>
nmap <S-r> :e<CR>
nmap <S-f> :set foldmethod=syntax<CR>
" nmap <S-h> <C-W>h
" nmap <S-l> <C-W>l
" nmap <S-j> <C-W>j
" nmap <S-k> <C-W>k
" nmap <C-w><leader> :vsplit<CR>
" nmap <C-d> :vsplit<CR>
" nmap <S-d> :split<CR>

" Show the full path of current file
nmap ,fp :let @+=expand("%:p")<CR>
nmap ,k :nohl<CR>
