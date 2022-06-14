
" =======================================================
"        __  ___         _    ___                       +
"       /  |/  /_  __   | |  / (_)___ ___  __________   +
"      / /|_/ / / / /   | | / / / __ `__ \/ ___/ ___/   +
"     / /  / / /_/ /    | |/ / / / / / / / /  / /__     +
"    /_/  /_/\__, /     |___/_/_/ /_/ /_/_/   \___/     +
"           /____/                                      +
"                                                       +
" =======================================================

" Author: @Rogerskelamen

" import external file
source $HOME/.config/nvim/logo.vim

" correct checkhealth
let g:ruby_host_prog = '/opt/homebrew/lib/ruby/gems/3.1.0/bin/neovim-ruby-host'
let g:loaded_perl_provider = 0

" ============================ polyglot =======================
let g:polyglot_disabled = ['markdown']    " 禁用polyglot在markdown中的使用


" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"------------------------------
" basic mapping, 空格为leader键
"------------------------------
let mapleader=" "
" noremap ; :
noremap <LEADER>/ :nohlsearch<CR>

"----------------------------
" 普通键位映射
"----------------------------
" Save and quit
noremap S :w<CR>
noremap Q :q<CR>
noremap <C-q> :qa<CR>

" quick move
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l
noremap W 5w
noremap B 5b
noremap <expr>m col(".")==col("$")-1 ? "^" : "$"
vnoremap <expr>m col(".")==col("$")-1 ? "^" : "$h"

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
" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H
" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Open the vimrc file anytime
noremap <LEADER>rc :e $MYVIMRC<CR>
noremap <LEADER>sc :set spell!<CR>

" tab set
noremap tu :tabe<CR>j
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

" Copy to system clipboard
vnoremap Y "+y

" visual make to line end
noremap <silent> \v v$h

" Indentation
nnoremap < <<
nnoremap > >>

" clipboard history
nnoremap <silent> <LEADER>y  :<C-u>CocList -A --normal yank<cr>

" Folding
noremap <silent> <LEADER>o za

" find and replace
noremap \s :%s//g<left><left>

" close the neovim with everything saved
noremap <C-c> ZZ

" Press space twice to jump to the next '<++>' and edit it
" noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Disable the default s key
noremap s <nop>


" ============================ Editor behavior =======================
set exrc
set secure
set list
set listchars=tab:\|\ ,trail:▫  " 设置空格和层次结构,如果此时需要输入真正的tab，则输入Ctrl+V, tab，在windows下是Ctrl+Q, tab
set ttimeoutlen=0 " set map key delay
set notimeout
set viewoptions=cursor,folds,slash,unix
set inccommand=split
set completeopt=menuone,longest,preview,noinsert,noselect " complete options
set updatetime=300 " complete show delay
set lazyredraw
set visualbell " off the beeping
set virtualedit=block
" make the cursor go back to the last place when the file closed
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
autocmd TermOpen term://* startinsert   " 打开终端之后直接进入写入
" quick return to normal mode
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N>:q<CR>
" quick open a terminal
noremap <LEADER><CR> :call OpenTerminal()<CR>
func! OpenTerminal()
	if exists("g:term_exist")
		:sp
		:res -5
		:buffer term
		:normal i
	else
		let g:term_exist = 1
		:sp
		:res -5
		:term
	endif
endfunc

"----------------------------
" 全局的部分设置
"----------------------------
set encoding=utf-8
set fileencodings=utf-8,gbk " 写入文件时采用的编码类型
set termencoding=utf-8 " 输出到终端时采用的编码类型
set nocompatible " turn off the side-effects of vi
filetype on " turn on the filetype detect
filetype plugin on " turn on corresponding file plugin
filetype indent on " use current filetype to indent
" set mouse=a       " 设置是否可用鼠标
set clipboard=unnamedplus " 将系统的剪切板和vim共享
let &t_ut=''
set autochdir " always change directories
set scrolloff=5  " 上下滚动间隔距离为5行
" noremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
" 缓存所有的文件历史记录
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif


"------------------------------
" Vim UI
"------------------------------
syntax on
set number
set cursorline
set wrap
set wildmenu
set showcmd
set noshowmode " no hint when change modes


"-------------------------------------
" text searching/matching
"-------------------------------------
set hlsearch
set incsearch " match when typing pattern
set ignorecase
set smartcase


"-------------------------------------
" text indent/fold
"-------------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set indentexpr=
set tw=0 " avoid automatically cut lines
set backspace=indent,eol,start " make the backspace delete everything
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright " behavior when split vertically
set splitbelow " behavior when split horizontally

" set different filetype indent behavior
autocmd FileType html,css,javascript,vue,markdown setlocal shiftwidth=2 softtabstop=2 expandtab


" ===
" === Quickly Run
" ===
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		:sp
		:res -5
		:term ./%<
	elseif &filetype == 'cpp'
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -5
		:term ./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		:term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!open %"
	elseif &filetype == 'markdown'
		silent! exec "InstantMarkdownStop"
		silent! exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'vim'
		:so %
	elseif &filetype == 'dart'
		set splitbelow
		:sp
		:res -5
		:term dart %
		" exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		" silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		" :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
		:term node %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ===
" ===== 配色方案
" ===

" 设置背景透明度
autocmd Vimenter * hi Normal guibg=NONE ctermbg=NONE

" 亮暗方案
" set background=dark " for the dark version
" set background=light " for the light version

" for material colorscheme config
let g:material_terminal_italics = 1
let g:material_theme_style      = 'palenight'
colorscheme material

" for onedark colorscheme config
" let g:onedark_terminal_italics = 1
" colorscheme onedark

" neodark colorscheme config
" let g:neodark#background           = '#202020' " use black one as background
" let g:neodark#terminal_transparent = 1         " default: 0
" let g:neodark#italics              = 1         " default: 0
" colorscheme neodark

" for seoul256 colorscheme config
" colorscheme seoul256

" for nova colorscheme config
" let g:nova_transparent = 1
" colorscheme nova

" for dracula colorscheme config
" colorscheme dracula

" for cosmic_latte colorscheme config
" if strftime('%H') >= 7 && strftime('%H') < 19
	" set background=light
	" let g:airline_theme='cosmic_latte_light'
" else
	" set background=dark
	" let g:airline_theme='cosmic_latte_dark'
" endif
" colorscheme cosmic_latte

" catppuccin colorscheme
" colorscheme catppuccin_mocha

" =========================
" set for airline theme
" let g:airline_theme='material'
" let g:airline_theme='onedark'
" let g:airline_theme='nova'
" let g:airline_theme='atomic'
" let g:airline_theme='bubblegum'


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
	if (has("nvim"))
		"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	if (has("termguicolors"))
		set termguicolors
	endif
endif



" =================================
" ========  cursor setting ========
" =================================

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



" ===============================
" ======= All My Plugins ========
" ===============================
call plug#begin('~/.config/nvim/plugged')

" eleline - a elegant statusline
Plug 'Rogerskelamen/eleline.vim'
" Plug 'ojroques/vim-scrollstatus'

" File navigation
Plug 'kevinhwang91/rnvimr'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf' }

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'joker1007/vim-markdown-quote-syntax'
" Plug 'plasticboy/vim-markdown'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'
" Plug 'cohama/agit.vim'

" colourful
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'  " 设置语法高亮和自动缩进

" My beautiful colorscheme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'trevordmiller/nova-vim'
Plug 'junegunn/seoul256.vim'
Plug 'haystackandroid/cosmic_latte'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" Plug 'connorholyday/vim-snazzy'

" code edit
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/vim-cursorword'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" frontend enhance
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/html5.vim'

" tool things
Plug 'mhinz/vim-startify'
Plug 'preservim/tagbar'
Plug 'mbbill/undotree'
Plug 'azadkuh/vim-cmus'
Plug 'yianwillis/vimcdoc' " vim Chinese Document
" Plug 'w0rp/ale'

call plug#end()


" ======================== startify setting =========================
" let g:startify_custom_header =
	" \ startify#pad(split(system('figlet -f 3d NEOVIM'), '\n'))
let g:startify_custom_header = neovim_logo
" 配合NerdTree的配置
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")


" ======================= file Navigation ====================
" fzf setting
" let g: fzf_preview_window = [ ' right:50% ' , ' ctrl-/ ' ]
nnoremap <LEADER>f :Files<CR>
" list Buffers
nnoremap <LEADER>b :Buffers<CR>
" ranger
nnoremap <LEADER>r :RnvimrToggle<CR>

" ===
" === cmus control
" ===
nnoremap <LEADER>m :Cmus<CR>



" ======================== COC.NVIM config ==========================
set hidden
set shortmess+=c

let g:coc_global_extensions = [
	\ 'coc-yank',
	\ 'coc-vimlsp',
	\ 'coc-syntax',
	\ 'coc-snippets',
	\ 'coc-marketplace',
	\ 'coc-json',
	\ 'coc-html',
	\ 'coc-emmet',
	\ 'coc-vetur',
	\ 'coc-tsserver',
	\ 'coc-jedi',
	\ 'coc-java',
	\ 'coc-go',
	\ 'coc-css',
	\ 'coc-clangd',
	\ 'coc-markmap',
	\ 'coc-tabnine',
	\ 'coc-calc'
	\ ]

if has("nvim-0.5.0") || has("patch-8.1.1564")
	" " Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ CheckBackspace() ? "\<TAB>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use Ctrl+h to show documentation in preview window.
nnoremap <silent> <C-h> :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction


" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" coc-snippets
" use snippets for pop words
imap <C-l> <Plug>(coc-snippets-expand)
" press Enter jump to next snippets selection
let g:coc_snippet_next = '<cr>'


" NOTE: do NOT use `nore` mappings
" popup a chinese translation
nmap <Leader>e <Plug>(coc-translator-p)
vmap <Leader>e <Plug>(coc-translator-pv)

" append calculations result on current expression
nmap <Leader>x <Plug>(coc-calc-result-append)


" ======================== GitGutter =========================
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber             = 0
let g:gitgutter_map_keys                       = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating           = 1
let g:gitgutter_sign_added                     = '▎'
let g:gitgutter_sign_modified                  = '░'
let g:gitgutter_sign_removed                   = '▏'
let g:gitgutter_sign_removed_first_line        = '▔'
let g:gitgutter_sign_modified_removed          = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>H :GitGutterPreviewHunk<CR>
nnoremap g- :GitGutterPrevHunk<CR>
nnoremap g= :GitGutterNextHunk<CR>


" ===
" === LazyGit
" ===
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
" setup mapping to call :LazyGit
nnoremap <silent> <leader>g :LazyGit<CR>


" ======================== javascript-libraries-syntax config =========================
let g:used_javascript_libs = 'underscore,backbone'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0


" ========================== NerdTree Config =======================
nnoremap <LEADER>p :NERDTreeFind<CR>
nnoremap <Tab> :NERDTreeToggle<CR>
noremap <C-l> <C-i>
let g:NERDTreeWinSize=25
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


" ======================== NerdCommenter =========================
let g:NERDSpaceDelims=1
autocmd filetype python let g:NERDSpaceDelims=0


" ======================== CursorWord =========================
let g:cursorword = 0 " close the cursor word function by default


" ========================= rainbow config =========================
let g:rainbow_active = 1 " activate rainbow by default
" 使rainbow在NERDTree中不起作用
let g:rainbow_conf = {
	\ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\ 'operators': '_,_',
	\ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\ 'separately': {
		\ '*': {},
		\ 'tex': {
			\	'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
			\	},
		\ 'lisp': {
			\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
			\   },
		\ 'vim': {
			\	'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			\	},
		\ 'css': 0,
		\ 'nerdtree': 0,
		\ }
	\ }
" let g:rainbow_conf = {
" \	'separately': {
" \		'nerdtree': 0,
" \	}
" \}


" ======================== auto-pairs =========================
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})


" ======================== eleline bar config =========================
let g:airline_powerline_fonts = 1


" ======================== Tagbar =========================
nnoremap tt :TagbarToggle<CR>
let g:tagbar_width = 26
let g:airline#extensions#tagbar#enabled = 0
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:headings',
		\ 'l:links',
		\ 'i:images'
		\ ],
		\ 'sort' : 0
		\ }


" ======================== Undotree =========================
noremap <LEADER>u :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
endfunc


" ====================
" =  javascript配置  =
" ====================
let g:javascript_plugin_jsdoc = 1


" +++++++++++++++++++++++
" +  markdown的配置项   +
" +++++++++++++++++++++++
let g:instant_markdown_autostart = 0  " not to autostart
let g:instant_markdown_mathjax = 1  " use latex lang

autocmd Filetype markdown noremap ,b a****<Esc>hi
autocmd Filetype markdown noremap ,i a**<Esc>i
autocmd Filetype markdown noremap ,u a<u></u><Esc>3hi
autocmd Filetype markdown noremap ,c a``````<Esc>2hi<CR><Esc>kA
autocmd Filetype markdown noremap ,$ a$$<CR>$$<Esc>O
autocmd Filetype markdown noremap ,k a<kbd></kbd><Esc>5hi

" Create markmap from the whole file
autocmd Filetype markdown nnoremap <Leader>z :CocCommand markmap.watch<CR>


" ======================== vim-markdown =========================
set conceallevel=2
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" ======================== markdown-quote-syntax-highlight =========================
" Add other file types in which quote syntax should be on.
let g:markdown_quote_syntax_on_filetypes = ['text']

" ======================== vim-table-mode ========================="
autocmd Filetype markdown nnoremap st :TableModeToggle<CR>
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



" =====================================
" === Necessary Commands to Execute ===
" =====================================
exec "nohlsearch"
