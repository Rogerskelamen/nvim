
" =======================================================
"        __  ___         _    ___                       +
"       /  |/  /_  __   | |  / (_)___ ___  __________   +
"      / /|_/ / / / /   | | / / / __ `__ \/ ___/ ___/   +
"     / /  / / /_/ /    | |/ / / / / / / / /  / /__     +
"    /_/  /_/\__, /     |___/_/_/ /_/ /_/_/   \___/     +
"           /____/                                      +
"                                                       +
" =======================================================

" author: @Rogerskelamen


"------------------------------
" basic mapping, 空格为leader键
"------------------------------
let mapleader=" "
noremap ; :
noremap <LEADER><CR> :nohlsearch<CR>
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

"----------------------------
" 普通键位映射
"----------------------------
" Save and quit
noremap S :w<CR>
noremap Q :q<CR>
noremap <C-p> :qa<CR>

" quick move
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l

" windows set
noremap <LEADER>l <C-w>l
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <up> :res -5<CR>
noremap <down> :res +5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
noremap <LEADER>s :split<CR>
noremap <LEADER>v :vsplit<CR>
noremap sv <C-w>t<C-w>H
noremap sj <C-w>t<C-w>K

" Open the vimrc file anytime
noremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>

" tab set
noremap tu :tabe<CR>j
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>
noremap <LEADER>sc :set spell!<CR>

" Copy to system clipboard
vnoremap Y "+y

" visual make to line end
noremap <silent> \v v$h

" Indentation
nnoremap < <<
nnoremap > >>

" clipboard history
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Folding
noremap <silent> <LEADER>o za

" find and replace
noremap \s :%s//g<left><left>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Disable the default s key
noremap s <nop>


" =====
" ===== System
" =====
set clipboard=unnamedplus " 将系统的剪切板和vim共享
let &t_ut=''
set autochdir



"""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
        :sp
        :res -5
        :term ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -5
		:term ./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ===
" === Editor behavior
" ===
set exrc
set secure
set noexpandtab
set list
set listchars=tab:\|\ ,trail:▫  " 设置空格和层次结构
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
" set colorcolumn=100
set virtualedit=block
make the cursor go back to the last place since the file closed
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
" let g:neoterm_autoscroll = 1
" autocmd TermOpen term://* startinsert
" tnoremap <C-N> <C-\><C-N>
" tnoremap <C-O> <C-\><C-N><C-O>

"----------------------------
" 全局的部分设置
"----------------------------
set enc=utf8
set fencs=utf8,gbk,gb2312,gb1803
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" set mouse=a       " 设置是否可用鼠标
set encoding=utf-8
let &t_ut=''
set scrolloff=5  " 上下滚动间隔距离为5行
set autochdir
noremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>


"------------------------------
" Vim UI
"------------------------------
set number
set relativenumber
set cursorline
set wrap
set wildmenu
set showcmd
set noshowmode

"--------------------------------------
" 设置不同的文件开启时执行命令
"--------------------------------------
" au BufEnter *.html :syntax on<CR>


"-------------------------------------
" text searching/matching
"-------------------------------------
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap _ nzz
noremap + Nzz

"-------------------------------------
" text formatting/layout
"-------------------------------------
"set paste  " 设置是否自动注释
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
syntax on

" 配色方案
"colorscheme Monokai
"colorscheme woju
"colorscheme material
"colorscheme tender
"colorscheme termschool
colorscheme neodark
"set background=dark " for the dark version
"set background=light " for the light version


" 设置背景透明度
hi Normal ctermfg=252 ctermbg=none

" ==============================
" ========  光标设置 ===========
" ==============================
" "Mode Settings

"let &t_SI.="\e[5 q" "SI = INSERT mode
"let &t_SR.="\e[4 q" "SR = REPLACE mode
"let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
"=============================================





" ======================
" === All My Plugin ====
" ======================
call plug#begin('~/.config/nvim/plugged')

" airline - a beautiful statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/webapi-vim'
Plug 'Wildog/airline-weather.vim'

" File navigation
Plug 'junegunn/fzf.vim'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dhruvasagar/vim-table-mode'
" Plug 'plasticboy/vim-markdown'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim'

" colourful
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
" Plug 'frazrepo/vim-rainbow'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'othree/html5.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'majutsushi/tagbar'
" Plug 'gko/vim-coloresque'   " 展示css的颜色

Plug 'PascalZh/vim-badapple'
" Plug 'godlygeek/tabular'
" Plug 'w0rp/ale'

call plug#end()


" startify的配置
let g:startify_custom_header =
       \ startify#pad(split(system('figlet -f slant NEOVIM 2021'), '\n'))
" 配合NerdTree的配置
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

" ========================
" coc配置
" ========================
set hidden
set updatetime=100
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 跳到下一个错误的位置
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 找到函数定义等
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-m>'
let g:coc_snippet_prev = '<c-n>'
    

" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" =========================
" ===== 设置NerdTree ======
" =========================
map <C-b> :NERDTreeMirror<CR>
map <C-b> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=25
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " 如果是最后一个窗口就关闭nerdTree
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif  " 如果是最后一个标签就关闭nerdTree
" 设置NERDTree和nerdtree-git联动
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusConcealBrackets = 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" nerdtree和vim-devicons联动
let g:webdevicons_conceal_nerdtree_brackets=1
" 使用nerd-highlight-syntax
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1


" nerdcommenter配置项
let g:NERDSpaceDelims=1
autocmd filetype python let g:NERDSpaceDelims=0

" rainbow的配置项
let g:rainbow_active = 1
" let g:rainbow_load_separately = [
" \   [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
" \   [ 'nerdtree', [['(', ')']] ],
" \   [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
" \   [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
" \]
" let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
" let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
" 使rainbow在NERDTree中不起作用
let g:rainbow_conf = {
\       'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\       'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\       'operators': '_,_',
\       'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\       'separately': {
\           '*': {},
\	    	'tex': {
\	    		'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\	    	},
\	    	'lisp': {
\	    		'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\	    	},
\	    	'vim': {
\	    		'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\	    	},
\	    	'css': 0,
\	    	'nerdtree': 0,
\	}
\}
" let g:rainbow_conf = {
" \	'separately': {
" \		'nerdtree': 0,
" \	}
" \}


"auto-pairs的配置项
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})

" airline bar config
let g:airline_theme='atomic'
" let g:airline_theme='angr'
" let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_detect_spell=1
set laststatus=2  "永远显示状态栏
" airline的所有符号设置
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.branch = ''
let g:airline_symbols.dirty='⚡'
" 关闭空白符检测
let g:airline#extensions#whitespace#enabled=0
" =============================
" ==== airline section配置 ====
" =============================
" let g:airline_section_c = airline#section#create(['%{getcwd()}'])
" let g:airline_section_b = airline#section#create(['file'])
" let g:airline_section_x = '%{expand("%")}'  " 显示文件名
" let g:airline_section_y = airline#section#create(['%{strftime("%D")}'])
let g:airline_section_z = airline#section#create(['%{strftime("%m/%d %H:%M ")}', 'linenr', 'maxlinenr'])
" let g:airline#extensions#tabline#enabled = 1
" ==============================
" 激活一些airline-extensions
let g:airline#extensions#branch#enabled = 1
" airline-weather的配置
let g:weather#appid = '988c4fdd6e7f9fca5032556b725a6198'
let g:weather#cache_file = '~/.cache/.weather'
let g:weather#cache_ttl = '3600'
let g:weather#area = 'wuhan,china'
let g:weather#unit = 'metric'
" let g:weather#format = '%s %.0f'
let g:weather#status_map = {
  \ "01d": "",
  \ "02d": "",
  \ "03d": "",
  \ "04d": "☁",
  \ "09d": "☂",
  \ "10d": "",
  \ "11d": "⚡",
  \ "13d": "",
  \ "50d": "",
  \ "01n": "☽",
  \ "02n": "",
  \ "03n": "",
  \ "04n": "☁",
  \ "09n": "☂",
  \ "10n": "",
  \ "11n": "⚡",
  \ "13n": "",
  \ "50n": "",
  \}


" Tagbar配置
nmap tt :TagbarToggle<CR>
let g:tagbar_width = 26
let g:airline#extensions#tagbar#enabled = 1
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Chapter',
        \ 'i:Section',
        \ 'k:Paragraph',
        \ 'j:Subparagraph'
    \ ]
\ }


" +++++++++++++++++++++++
"   markdown的配置项
" +++++++++++++++++++++++
let g:instant_markdown_autostart = 0  " not to autostart
let g:instant_markdown_mathjax = 1  " use latex lang

autocmd Filetype markdown noremap ,b a****<Esc>hi
autocmd Filetype markdown noremap ,i a**<Esc>i
autocmd Filetype markdown noremap ,u a<u></u><Esc>3hi
autocmd Filetype markdown noremap ,$ a$$<CR>$$<Esc>O
autocmd Filetype markdown noremap ,k a<kbd></kbd><Esc>5hi

" vim-markdown的配置
set conceallevel=2
let g:tex_conceal = ""
let g:vim_markdown_math = 1


" vim-table-mode配置
autocmd Filetype markdown map <LEADER>t :TableModeToggle<CR>
" use || or __ enable table mode
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"
