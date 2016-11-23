"set nocompatible              " be iMproved, required
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

"set nocompatible

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

set guifont=Droid\ Sans\ Mono\ 9

autocmd BufRead * '" 

set smartindent
set shiftwidth=4
set tabstop=4
set noexpandtab


filetype plugin on
set omnifunc=syntaxcomplete#Complete

"set colorcolumn=101
highlight ColorColumn ctermbg=235 guibg=#303030

set tags=tags;/

set scrolloff=8

set cpoptions+=$

set laststatus=2
set statusline=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>

map <C-H> :YcmCompleter GoToDeclaration<CR>
map <F10> :YcmCompleter GoToReferences<CR>

let g:ctrlp_root_markers = ['.root']
nmap ,f :CtrlPBuffer<cr>

"runtime! ftplugin/man.vim

imap jj <Esc>
cmap jj <Esc>
"set term=screen-256color
"set nocompatible
"set ttyfast
set lazyredraw

let g:EclimCompletionMethod = 'omnifunc'
let g:EclimCSearchSingleResult = 'edit'
nmap <C-J> :CSearchContext<CR>

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
