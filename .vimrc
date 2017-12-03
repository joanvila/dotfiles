set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Color schemes
Plugin 'joshdick/onedark.vim'

" General plugins
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'leshill/vim-json'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'haya14busa/incsearch.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-sleuth' " Automatic indentation

" Python plugins
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'

" Markdown plugins
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" JavaScript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

let mapleader = "\<Space>"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
colorscheme onedark

filetype plugin on
filetype plugin indent on
set autoread
" set spell spelllang=en_gb
set number " Show line numbers
set list " Show trailing whitespaces
set listchars=tab:▸\ ,trail:▫
set clipboard=unnamed " Share clipboard with system

" Be able to use :W as :w ad :Q as :Q
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

" Breakpoints for python (use with <leader> + b)
au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>

" Undo shortcut
nnoremap <Leader>u :u<CR>
" Save shortcut
nnoremap <Leader>w :w<CR>
" Close tab shortcut
nnoremap <Leader>c :bd<CR>
" Set paste shortcut
nnoremap <Leader>p :set paste<CR>
" Set no paste shortcut
nnoremap <Leader>P :set nopaste<CR>

" airline
nmap <tab> :bnext<CR>
nmap <S-tab> :bprevious<CR>
set laststatus=2
set ttimeoutlen=50
let g:airline#theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#left_alt_sep = '|'

" CtrlP
let g:ctrlp_show_hidden = 1 " Show hidden files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " Ignore .gitignore files

" flake8
autocmd BufWritePost *.py call Flake8() " Run flake8 on each file when saving it

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_debug = 3

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" onedark colorscheme
let g:onedark_termcolors = 256

" incsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" NERDTree
map <Leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Easymotion
map  <Leader>g <Plug>(easymotion-bd-w)
