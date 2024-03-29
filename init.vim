
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

" import external logo file
source $HOME/.config/nvim/logo.vim

" correct checkhealth
let g:ruby_host_prog = '/opt/homebrew/lib/ruby/gems/3.1.0/bin/neovim-ruby-host'
let g:loaded_perl_provider = 0


" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"-----------------------------------
" basic mapping, Space is leader key
"-----------------------------------
let mapleader=" "
" noremap ; :
noremap <LEADER>/ :nohlsearch<CR>

" Save and quit
nnoremap S :w<CR>
nnoremap Q :q<CR>
nnoremap <C-q> :qa<CR>

" Quick move
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l
noremap W 5w
noremap B 5b
noremap <expr>m col(".")==col("$")-1 ? "^" : "$"
vnoremap <expr>m col(".")==col("$")-1 ? "^" : "$h"

" Move text up and down
vnoremap <C-j> :move '>+1<CR>gv-gv
vnoremap <C-k> :move '<-2<CR>gv-gv
vnoremap p "_dP

" Windows set
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

" Tab set
noremap tu :tabe<CR>j
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

" Copy to system clipboard
" vnoremap Y "+y

" Visual make to line end
noremap <silent> \v v$h

" Indentation
nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

" Clipboard history
nnoremap <silent> <LEADER>y  :<C-u>CocList -A --normal yank<cr>

" Folding
noremap <silent> <LEADER>o za

" Find and replace
noremap \s :%s//g<left><left>

" Press space twice to jump to the next '<++>' and edit it
" noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" Press space twice to quickly get into the popup window
noremap <LEADER><LEADER> <C-w><C-w>

" Disable the default s and leader key
noremap s <nop>
noremap <Space> <nop>


" ============================ Editor behavior =======================
let &t_ut=''
set autochdir " always change directories
set scrolloff=5  " scroll interval is 5 lines
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


"----------------------------
" filetype config
"----------------------------
set encoding=utf-8
set fileencodings=utf-8,gbk " encoding when editing
set termencoding=utf-8 " encoding when enter terminal
set nocompatible " turn off the side-effects of vi
filetype on " turn on the filetype detect
filetype plugin on " turn on corresponding file plugin
filetype indent on " use current filetype to indent
set mouse=       " set whether to use mouse
set mousescroll=ver:1,hor:1 " mouse scroll interval
set clipboard=unnamedplus " share clipboard with OS
" noremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
" cache all the file edit history
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
" set relativenumber
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
set noexpandtab
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


" ===
" === Terminal Behaviors
" ===
autocmd TermOpen term://* startinsert   " get input immediately after enter term
" quick return to normal mode
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N>:q<CR>
" quick open a terminal
noremap <LEADER><CR> :call OpenTerminal()<CR>
func! OpenTerminal() abort
	if bufexists(bufnr('zsh'))
		:sp
		:res -5
		:b term
		:normal i
	else
		:sp
		:res -5
		:term
	endif
endfunc


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
" === Color Scheme
" ===

" use 24-bit (true colors) mode
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set the normal text backgroud to none(which makes transparency)
autocmd Vimenter * hi Normal guibg=NONE ctermbg=NONE

" background scheme
set background=dark " for the dark version
" set background=light " for the light version

" for everforest colorscheme config
let g:everforest_background                = 'medium' " hard, medium[default], soft
let g:everforest_transparent_background    = 2
" let g:everforest_enable_italic             = 1
let g:everforest_better_performance        = 1
let g:everforest_cursor                    = 'auto' " auto[default], red, orange, yellow, green, aqua, blue, purple
let g:everforest_spell_foreground          = 'colored'
let g:everforest_ui_contrast               = 'low'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_diagnostic_virtual_text   = 1
colorscheme everforest

" for material colorscheme config
" let g:material_terminal_italics = 1
" let g:material_theme_style      = 'palenight'
" colorscheme material

" switch to snazzy config
" let g:SnazzyTransparent = 1
" colorscheme snazzy

" for onedark colorscheme config
" let g:onedark_terminal_italics = 1
" colorscheme onedark

" neodark colorscheme config
" let g:neodark#background           = '#202020' " use black one as background
" let g:neodark#terminal_transparent = 1         " default: 0
" let g:neodark#italics              = 1         " default: 0
" colorscheme neodark

" for nova colorscheme config
" let g:nova_transparent = 1
" colorscheme nova

" for dracula colorscheme config
" colorscheme dracula

" for nvim catppuccin
" lua require('user.colorscheme')
" colorscheme catppuccin


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

" eleline -- a elegant statusline
Plug 'Rogerskelamen/eleline.vim'
" Plug 'ojroques/vim-scrollstatus'

" File navigation
Plug 'kevinhwang91/rnvimr'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf' }
Plug 'is0n/fm-nvim'

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
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" My beautiful colorscheme
Plug 'sainnhe/everforest'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'trevordmiller/nova-vim'
Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" code edit
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/vim-cursorword'

" frontend enhance
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/html5.vim'

" tool things
Plug 'mhinz/vim-startify'
" Plug 'glepnir/dashboard-nvim'
Plug 'preservim/tagbar'
Plug 'mbbill/undotree'
Plug 'azadkuh/vim-cmus'
Plug 'dstein64/vim-startuptime'
Plug 'yianwillis/vimcdoc' " vim Chinese Document
" Plug 'w0rp/ale'

call plug#end()


" ======================== startify setting =========================
" let g:startify_custom_header =
	" \ startify#pad(split(system('figlet -f 3d NEOVIM'), '\n'))
let g:startify_custom_header = neovim_logo
" pair with NerdTree
" let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

" ======================== dashboard setting =========================
" lua require('user.dashboard')

" ======================= file Navigation ====================
" fzf setting
" let g: fzf_preview_window = [ ' right:50% ' , ' ctrl-/ ' ]
nnoremap <LEADER>ff :Files<CR>
" list Buffers
nnoremap <LEADER>b :Buffers<CR>
" history files
nnoremap <LEADER>fh :History<CR>
" ranger
nnoremap <LEADER>rg :RnvimrToggle<CR>

" ===
" === cmus control
" ===
nnoremap <LEADER>m :Cmus<CR>



" ======================== COC.NVIM config ==========================
set hidden
set shortmess+=c

let g:coc_global_extensions = [
	\ 'coc-explorer',
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
	\ 'coc-translator',
	\ 'coc-tabnine',
	\ 'coc-calc'
	\ ]

if has("nvim-0.5.0") || has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use <tab> for trigger completion and navigate to the next complete item
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

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
nnoremap <silent> <leader>g :LazyGitCurrentFile<CR>


" ======================== javascript-libraries-syntax config =========================
let g:used_javascript_libs = 'underscore,backbone'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0


" ========================== Coc Explorer =======================
nnoremap <Tab> :CocCommand explorer<CR>
noremap <C-l> <C-i>


" ======================== NerdCommenter =========================
let g:NERDSpaceDelims=1


" ======================== CursorWord =========================
let g:cursorword = 0 " close the cursor word function by default


" ========================= rainbow config =========================
let g:rainbow_active = 1 " activate rainbow by default
let g:rainbow_conf = {
	\ 'guifgs': ['#98dc98', '#7fbbb3', '#e67e80', '#fff9e8', '#d699b6'],
	\ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
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
		\ }
	\ }


" ======================== auto-pairs =========================
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})


" ======================== eleline bar config =========================
let g:eleline_powerline_fonts = 1


" ======================== Tagbar =========================
nnoremap tt :TagbarToggle<CR>
let g:tagbar_width = 26
" config for markdown
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


" ========================
" =  javascript setting  =
" ========================
let g:javascript_plugin_jsdoc = 1


" =======================
" =  markdown setting   =
" =======================
let g:instant_markdown_autostart = 0  " not to autostart
let g:instant_markdown_mathjax = 1  " use latex lang


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
