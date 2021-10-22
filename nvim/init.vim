" vim-plug
let plug_path='~/.config/nvim/plugged/'
call plug#begin(plug_path)
" 函数树
Plug 'majutsushi/tagbar'
" 文件树
"Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" 文件快速检索
"Plug 'kien/ctrlp.vim'
" 关键字补全
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'
" 补全成对符号
Plug 'jiangmiao/auto-pairs'
" 光标快速移动
Plug 'easymotion/vim-easymotion'
" 光标移动
Plug 'bkad/CamelCaseMotion'
"优化tab(似乎于coc.nvim默认配置冲突)
"Plug 'ervandew/supertab'
" 快速注释
"Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
" 自动对齐
Plug 'junegunn/vim-easy-align'
" 多光标
Plug 'mg979/vim-visual-multi'
" git插件
Plug 'tpope/vim-fugitive'
" 成对符号操作
Plug 'tpope/vim-surround'
" 提升.重复操作的功能
Plug 'tpope/vim-repeat'
" 提升undo功能
Plug 'sjl/gundo.vim'
" 高亮选择单词
"Plug 'lfv89/vim-interestingwords'
" vim-mark 2.8.5
Plug 'inkarkat/vim-mark', {'commit': '0f8628db067810b933f0dedcfb326cab4b6dd9cc'}

" 模糊搜索
"Plug 'junegunn/fzf', { 'do': { -> fzf#install()   }   }
"Plug 'junegunn/fzf.vim'
" 启动页
Plug 'mhinz/vim-startify'
" 状态栏
Plug 'vim-airline/vim-airline'
" 主题
"Plug 'tomasr/molokai'
"Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
" 高亮尾部空白
Plug 'ntpeters/vim-better-whitespace'
" 缩进线
Plug 'Yggdroot/indentLine'
" 高亮成对符号
Plug 'luochen1990/rainbow'
" golang
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'  }
" markdown
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" other
Plug 'vim-scripts/nginx.vim'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" coc插件, coc启动时自动安装
" 智能补全：coc-tabnine
" 搜索: coc-lists
" 目录树: coc-explorer
" 片段: coc-snippets
" vue语言服务器: coc-vetur
let g:coc_global_extensions = [
	\ 'coc-tabnine',
	\ 'coc-lists',
	\ 'coc-snippets',
	\ 'coc-git',
	\ 'coc-explorer',
	\ 'coc-json',
	\ 'coc-pyright',
	\ 'coc-go',
	\ 'coc-vetur',
	\ 'coc-tsserver',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-yaml',
	\ 'coc-thrift-syntax-support',
\ ]


" ------------------------------- common setting ------------------------
"
scriptencoding utf-8
syntax on
syntax enable
set undofile
set mouse=                 " disable mouse usage
set mousehide               " Hide the mouse cursor while typing
set cursorline                  " Highlight current line
set showmode                    " Display the current mode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set relativenumber              " 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set showmatch                   " 显示括号匹配

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

set autoindent                  " 继承前一行的缩进方式，适用于多行注释
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

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
set langmenu=zh_CN.UTF-8
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=&encoding
" 按照语法折叠
set fdm=syntax

let mapleader = ','

" 复制选中区到系统剪切板中
noremap <leader>y "+y
nnoremap <silent> <leader>y :call system('/mnt/c/Windows/System32/clip.exe', @0)<CR>
vnoremap <silent> <leader>y :call system('/mnt/c/Windows/System32/clip.exe', @0)<CR>

" 折叠
"nnoremap <space> za

nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>

nnoremap Q <Nop>
nnoremap H ^
nnoremap L $
nnoremap <leader>" ciw""<esc>P
nnoremap <leader>' ciw''<esc>P
nnoremap <leader>< ciw<><esc>P
nnoremap <leader>( ciw()<esc>P
nnoremap <leader>[ ciw[]<esc>P
nnoremap <leader>{ ciw{}<esc>P
nnoremap <silent>;q :q<cr>
nnoremap <silent>;Q :q!<cr>
nnoremap <silent>;w :w<cr>
nnoremap <silent>;e :qa<cr>
nnoremap <silent>;E :qa!<cr>
nnoremap <silent>;x :x<cr>
" close <c-q> fun, avoid launch vitual mode
nnoremap <c-q> <esc>
" 用sudo权限保存文件
nnoremap <leader>W :execute 'w !sudo tee >/dev/null %' \| :e!<cr>
nnoremap <leader>X :execute 'w !sudo tee >/dev/null %' \| :q!<cr>

vnoremap <leader>" di""<esc>P
vnoremap <leader>' di''<esc>P
vnoremap <leader>< di<><esc>P
vnoremap <leader>( di()<esc>P
vnoremap <leader>[ di[]<esc>P
vnoremap <leader>{ di{}<esc>P
vnoremap * y/0<cr>
vnoremap # y?0<cr>
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
vnoremap <space> 0<c-v>I <esc>gvV

"insert mode keymap
inoremap <c-b> <left>
inoremap <c-f> <right>
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-h> <c-left>
inoremap <c-l> <c-right>
"inoremap <c-d> <del>
inoremap <c-j> <esc>o

" TAB
map <silent><c-b> :tabnext<cr>
map <silent><c-f> :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"ex mode keymap
"cnoremap <c-d> <del>
cnoremap <c-a> <Home>
cnoremap <c-b> <left>
cnoremap <c-f> <right>
cnoremap <c-h> <c-left>
cnoremap <c-l> <c-right>
"cnoremap <c-x> <c-f>

" nvim/neovim terminal
tnoremap <c-q> <c-\><c-n>
"tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
let $CONF = "~/.config/nvim/init.vim"

nnoremap <leader>C :!rm ~/.local/share/nvim/swap/* -rf<cr>
nnoremap <leader>T :vs term://zsh<cr>a

nnoremap <esc><esc> :nohlsearch<CR>


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


" ---------------------- event -------------------------------
"
autocmd BufWritePost *.md :silent!%s/\t/    /g

" 插入模式下用绝对行号, 普通模式下用相对
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost init.vim source %


" set python config
autocmd BufNewFile,BufRead *.py
    \ set textwidth=79 |
    \ set fileformat=unix |
    \ set foldmethod=indent |
    \ set foldnestmax=2 |
    \ set expandtab |  " Tabs are spaces, not tabs
    \ set shiftround   " round indent to multiple of 'shiftwidth'"

" set web config
"au BufNewFile,BufRead *.js,*.html,*.css
"            \ set tabstop=2 |
"            \ set softtabstop=2 |
"            \ set shiftwidth=2

" nginx.conf 语法高亮, 必须在×.conf语法高亮之前配置
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* setfiletype nginx

" 语法高亮 .conf 文件
autocmd BufRead,BufNewFile *.conf setf dosini

" ------------------------- other setting --------------------
" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumberAndSign()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
	if(&number)
		set signcolumn=yes
	else
		set signcolumn=no
	endif
    set number?
endfunc
nnoremap <F2> :call HideNumberAndSign()<CR>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>
"    when in insert mode, press <F5> to go to
"    paste mode, where you can paste mass data
"    that won't be autoindented

"    F5
au FileType python nnoremap <f5> :!python3 %<cr>
au FileType go nnoremap <f5> :!go run %<cr>


set pastetoggle=<F6>
" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste
" F6 set paste问题已解决, 粘贴代码前不需要按F6了
" F6 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


" ------------------------- plugin setting ----------------------
"
" vim-interestingwords
"let g:interestingWordsCycleColors=1
"let g:interestingWordsDefaultMappings=0
"nnoremap <silent> <leader>m :call InterestingWords('n')<cr>
"vnoremap <silent> <leader>m :call InterestingWords('v')<cr>
"nnoremap <silent> <leader>M :call UncolorAllWords()<cr>

" 主题
"colorscheme solarized
colorscheme gruvbox
"colorscheme molokai

" solarized
let g:solarized_termcolors=256
" molokai
let g:molokai_original=1
let g:rehash256=1

set background=dark
set t_Co=256
" set term=screen-256color


" tagbar
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
set updatetime=1000

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" easymotion
map <leader><leader>h <plug>(easymotion-linebackward)
map <leader><leader>l <plug>(easymotion-lineforward)
map f <leader><leader>w
map F <leader><leader>b

" supertab
"let g:SuperTabDefaultCompletionType = "<c-n>"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"

" vim-better-whitespace
autocmd! BufEnter *.py EnableStripWhitespaceOnSave
autocmd! BufWritePost *.py StripWhitespace

" nerdcommenter
" let g:NERDRemoveExtraSpaces = 0
let g:NERDDefaultAlign = 'left'

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

" rainbow
let g:rainbow_active = 1

" -------------------- other vim config ----------
source ~/.config/nvim/google_python_style.vim


" 最大化编辑的窗口
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>

" 配置python主程序
let g:python3_host_prog = '~/.env/py3/bin/python3'

" IndentLines
map <F9> :IndentLinesToggle<cr>

" 注释回车不自动新增注释符号
augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " This can be done as well instead of the previous line, for
    " setting formatoptions as you choose:
    autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END


" ------------------------------- CamelCaseMotion -------------------------------
let g:camelcasemotion_key = '<leader>'


" ------------------------------- fugitive -------------------------------
nnoremap <leader>gd :Gdiff!<CR>
nnoremap <silent>gh :diffget //2<CR>
nnoremap <silent>gl :diffget //3<CR>


" ------------------------------- coc.nvim -------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent><nowait> <space>g  :<C-u>CocList grep -w <c-r><c-w><CR>
nnoremap <silent><nowait> <space>G  :<C-u>CocList grep <c-r><c-w><CR>
nnoremap <silent><nowait> <space>f  :<C-u>CocList files<CR>
nnoremap <silent><nowait> <space>l  :<C-u>CocList 



" ------------------------------- coc-snippets -------------------------------
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


" ------------------------------- coc-explorer -------------------------------
nmap <space>e :CocCommand explorer<CR>


" ------------------------------- coc-highlight -------------------------------
"set termguicolors
"autocmd CursorHold * silent call CocActionAsync('highlight')
