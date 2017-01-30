set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" YouComplete
Plugin 'Valloric/YouCompleteMe'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Tagbar
Plugin 'majutsushi/tagbar'

" Xoria256
Plugin 'xoria256.vim'

Plugin 'VisIncr'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'derekwyatt/vim-fswitch'

Plugin 'tpope/vim-fugitive'

Plugin 'rdnetto/YCM-Generator'

Plugin 'L9'
Plugin 'FuzzyFinder'

Plugin 'tsukkee/unite-tag'

Plugin 'terryma/vim-smooth-scroll'

" All of your Plugins must be added before the following line
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
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

source $VIMRUNTIME/delmenu.vim
set langmenu=en_US.UTF-8
source $VIMRUNTIME/menu.vim

set number
set relativenumber
set wildmenu

"set t_Co=256

colorscheme xoria256
set hlsearch
set cursorline

set nowrap

set incsearch

syntax on

set hidden

set virtualedit=all

nmap <F7> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

nmap <silent> ,of :FSHere<CR>
nmap <silent> ,ol :FSRight<CR>
nmap <silent> ,oL :FSSplitRight<CR>
nmap <silent> ,oh :FSLeft<CR>
nmap <silent> ,oH :FSSplitLeft<CR>
nmap <silent> ,ok :FSAbove<CR>
nmap <silent> ,oK :FSSplitAbove<CR>
nmap <silent> ,oj :FSBelow<CR>
nmap <silent> ,oJ :FSSplitBelow<CR>

"set columns=999
"set lines=999

set guioptions-=T

set ch=2

if has("macunix")
  set guifont=Menlo:h11
elseif has("win32")
  set guifont=Consolas:h10
else
  set guifont=DejaVu\ Sans\ Mono\ 9
endif

autocmd BufRead * '" 

set smartindent
set shiftwidth=2
set tabstop=2
set expandtab

set backspace=2

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set colorcolumn=81
highlight ColorColumn ctermbg=235 guibg=#303030

set tags=tags;/

set scrolloff=8

set cpoptions+=$

set laststatus=2
set statusline=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

"map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>
"imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>

map <C-H> :YcmCompleter GoToDeclaration<CR>
"map <C-M> :YcmCompleter GoToDefinition<CR>
map <F10> :YcmCompleter GoToReferences<CR>

let g:ctrlp_root_markers = ['.root']
let g:ctrlp_max_files = 0
let g:ctrlp_user_command = 'ag -l --nocolor --hidden -g "" %s'
let g:user_command_async = 1
let g:ctrlp_lazy_update = 1
let g:ctrlp_map = ''
nmap ,f :CtrlPBuffer<cr>

set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

"runtime! ftplugin/man.vim

imap jj <Esc>
cmap jj <Esc>
"set term=screen-256color
"set ttyfast
set lazyredraw

let g:EclimCompletionMethod = 'omnifunc'
let g:EclimCSearchSingleResult = 'edit'
nmap <C-M> :CSearchContext<CR>

nmap <C-P> :LocateFile<CR>

"nmap <C-J> <C-D>
"nmap <C-K> <C-U>
noremap <silent> <C-K> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <C-J> :call smooth_scroll#down(&scroll, 0, 3)<CR>

set shellslash

set encoding=utf-8

au BufEnter *.h let b:fswitchdst  = 'cpp,cc'
au BufEnter *.cpp let b:fswitchdst  = 'h,hpp'
au BufEnter *.cc let b:fswitchdst  = 'h,hpp'

"autocmd CursorMoved * exe printf('match StatusLine /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction
