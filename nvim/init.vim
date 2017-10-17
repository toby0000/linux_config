" vim-plug
let plug_path='~/.config/nvim/plugged/'
call plug#begin(plug_path)
Plug 'davidhalter/jedi-vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'kien/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'sjl/gundo.vim'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'vim-scripts/nginx.vim'
Plug plug_path.'Solarized'
Plug plug_path.'mark.vim'
call plug#end()

scriptencoding utf-8
syntax on
syntax enable
set undofile
set mouse=                 " disable mouse usage
set background=dark
set mousehide               " Hide the mouse cursor while typing
set cursorline                  " Highlight current line
set showmode                    " Display the current mode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis

" search
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

set winminheight=0              " Windows can be 0 line high
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

set autoindent                  " Indent at the same level of the previous line
set smartindent
set cindent
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"set cinkeys=0{,0},0),:,!^F,o,O,e
set showcmd                     " show the cmd you input
set ruler                       " show the current position

" TAB
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set shiftround
set expandtab

"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set foldmethod=marker
set foldlevel=99
set updatetime=1000

" don't automatically wrap text when typing
set formatoptions-=t

" don't automatically wrap on load
set nowrap

" disable stupid backup and swap files - they trigger too many events for file
" system watchers
set nobackup
set nowritebackup
set noswapfile

let mapleader = ','
nnoremap <c-p> :<c-p>
nnoremap <c-n> :<c-n>
nnoremap <space> :

nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap H ^
nnoremap L $

nnoremap <c-b> gt

nnoremap <leader>" ciw""<esc>P
nnoremap <leader>' ciw''<esc>P
nnoremap <leader>< ciw<><esc>P
nnoremap <leader>( ciw()<esc>P
nnoremap <leader>[ ciw[]<esc>P
nnoremap <leader>{ ciw{}<esc>P
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>e :qa<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>z :q!<cr>
" close <c-q> fun, avoid launch vitual mode
nnoremap <c-q> <esc>

vnoremap <leader>" di""<esc>P
vnoremap <leader>' di''<esc>P
vnoremap <leader>< di<><esc>P
vnoremap <leader>( di()<esc>P
vnoremap <leader>[ di[]<esc>P
vnoremap <leader>{ di{}<esc>P
vnoremap * y/0<cr>
vnoremap # y?0<cr>

"insert mode keymap
inoremap <c-b> <left>
inoremap <c-f> <right>
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-j> <esc>o

"ex mode keymap
cnoremap <c-d> <del>
cnoremap <c-a> <Home>
cnoremap <c-b> <left>
cnoremap <c-f> <right>
cnoremap <c-x> <c-f>

" nvim/neovim terminal
tnoremap <c-q> <c-\><c-n>
"tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
let $CONF = "~/.config/nvim/init.vim"

nnoremap <leader>C :!rm ~/.local/share/nvim/swap/* -rf<cr>
nnoremap <leader>T :vs term://zsh<cr>a

nnoremap <leader><leader>/ :nohlsearch<CR>

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>
"    when in insert mode, press <F5> to go to
"    paste mode, where you can paste mass data
"    that won't be autoindented
set pastetoggle=<F5>
" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste
" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


" mark.vim
nnoremap <leader>c :MarkClear<cr>

" molokai
" let g:molokai_original=1
let g:rehash256=1

" solarized
 colorscheme solarized
" colorscheme distinguished
" colorscheme github
" colorscheme molokai
" colorscheme zenburn
set t_Co=256
" set term=screen-256color

" tagbar
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
set updatetime=1000

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

let OmniCpp_NamespaceSearch = 2 "search namespaces in the current buffer and in include files

" tag
set tags=tags;
nmap <leader>j :tn<cr>
nmap <leader>k :tp<cr>
"nmap <leader>ts :ts<cr>

" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_root_markers = ["tags", "cscope.out"]
let g:ctrlp_clear_cache_on_exit = 0
set wildignore=*.o,*.obj,*.d,*/.git/*,*.a,*.so,*.pyc,*/__pycache__/*
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>u :CtrlPMRUFiles<cr>

" cscope
set cspc=3
let g:cscope_auto_update = 1
"set csprg=/usr/local/bin/cscope
set csto=0
set nocst
let g:cscope_silent = 1
let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.java$'
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
nnoremap <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
nnoremap <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
nnoremap <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
nnoremap <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
nnoremap <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
nnoremap <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
nnoremap <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
nnoremap <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

" easymotion
map <leader><leader>h <plug>(easymotion-linebackward)
map <leader><leader>l <plug>(easymotion-lineforward)
map f <leader><leader>w
map F <leader><leader>b

" jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_command = "<c-l>"
let g:jedi#popup_on_dot = 0

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" deoplete
let g:deoplete#enable_at_startup=1

" neomake
"let g:neomake_python_enable_makers = ['pylint', 'flake8', 'pep8']
let g:neomake_python_enable_makers = ['flake8', 'pep8']
let g:neomake_shell_enable_makers = ['shellcheck']
"let g:neomake_verbose=2
"let g:neomake_echo_current_error=1
"let g:neomake_open_list=1
autocmd! BufWritePost * Neomake

" vim-better-whitespace
autocmd! BufEnter *.py EnableStripWhitespaceOnSave
autocmd! BufWritePost *.py StripWhitespace

" nerdcommenter
" let g:NERDRemoveExtraSpaces = 0
let g:NERDDefaultAlign = 'left'

" ack.vim
let g:ackprg = 'ag --vimgrep --smart-case'
nnoremap <leader>a :Ack! -w <c-r><c-w><cr>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" gundo
nnoremap <f7> :GundoToggle<CR>

" vim-snippet
let g:ultisnips_python_style = 'sphinx'

" markdown
" don't auto open chrome for preview
let g:instant_markdown_autostart = 0
map <F8> :InstantMarkdownPreview<cr>


" not need to set follow config when use nvim
"set encoding=utf-8
"set termencoding=cp936
"set fileencodings=ucs-bom,utf-8,cp936,gdk
"let &termencoding=&encoding

" set python config
"autocmd BufNewFile,BufRead *.py exec ":call SetPythonConfig()"
"func SetPythonConfig()
"    set textwidth=79
"    set fileformat=unix
"    set foldmethod=indent
"    nnoremap <space> za
"endfunc
autocmd BufNewFile,BufRead *.py
            \ set textwidth=79 |
            \ set fileformat=unix |
            \ set foldmethod=indent |
			\ set expandtab |  " Tabs are spaces, not tabs
			\ set shiftround   " round indent to multiple of 'shiftwidth'"

" nginx.conf 语法高亮, 必须在×.conf语法高亮之前配置
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* setfiletype nginx

" 语法高亮 .conf 文件
autocmd BufRead,BufNewFile *.conf setf dosini


" highlight the char which over length of 80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" 1
" highlight OverLength ctermbg=red
" match OverLength /\%81v.\+/
" 2
" highlight ColorColumn ctermbg=188
set colorcolumn=80

" highlight the redundance space
"highlight BadWhitespace ctermbg=red
"match BadWhitespace /\s\+$/

" set web config
au BufNewFile,BufRead *.js,*.html,*.css
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2

nnoremap <f10> :!python %<cr>
nnoremap <f9> :!python3 %<cr>
source ~/.config/nvim/google_python_style.vim
"autocmd FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p autocmd FileType python set errorformat=%f:%l:\ %m
