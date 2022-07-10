" We start by installing Vim plugin manager to manage plugins.
" A Lot of customizations done here.

let g:ale_disable_lsp = 1
let g:OmniSharp_want_snippet=1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 0
let g:OmniSharp_server_use_net6 = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "left"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/ultisnips']
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsListSnippets="<C-Tab>"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'

" Terminal in neovim
Plug 'voldikss/vim-floaterm'

" OmniSharp syntax
Plug 'OmniSharp/omnisharp-vim', {'for':['cs','csx','cshtml.html','csproj','solution'], 'on': ['OmniSharpInstall']}

" Colorscheme
Plug 'EvitanRelta/vim-colorschemes'
Plug 'tomasiser/vim-code-dark'
Plug 'sainnhe/edge'
Plug 'joshdick/onedark.vim'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Maximize window
Plug 'szw/vim-maximizer'

" Debug and test
Plug 'puremourning/vimspector'
Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }

Plug 'prettier/vim-prettier', { 'do': 'npm install' , 'branch' : 'release/1.x' }

" Linting/error highlighting
Plug 'dense-analysis/ale'

"Fuzzy Search + Ripgrep for search files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyoh86/vim-ripgrep'

" Mappings, code-actions available flag and statusline integration
" Plug 'nickspoons/vim-sharpenup'
Plug 'ervandew/supertab'

" Snippet support
" Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" HTML Snippet
Plug 'mattn/emmet-vim'
Plug 'valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" SASS SCSS
Plug 'cakebaker/scss-syntax.vim'

" JS TS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

" Front-end framework
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mlaursen/vim-react-snippets'
Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'

" Rust syntax
Plug 'rust-lang/rust.vim'

" Comment
Plug 'preservim/nerdcommenter'

" Bracey - live server
Plug 'turbio/bracey.vim'

" Indent line
Plug 'Yggdroot/indentLine'

" Nvim-pqf
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'

" DevIcons - always load at the end
Plug 'ryanoasis/vim-devicons'

call plug#end()

" NERD Tree shortcuts
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:NERDTreeWinSize=30
:map <C-b> :NERDTreeToggle<CR>

" Fzf key shortcuts
:map <C-g> :GFiles<CR>
:map <C-f> :Files<CR>
:map <silent> <Leader>fg :Rg<CR>	
"collapse json files by themselves.
:map <C-j> :set filetype=json \| :syntax on \| :set foldmethod=syntax
"zo for open
"zc for close

" Floaterm Config keymap
let g:floaterm_keymap_new = '<C-S-t>'
let g:floaterm_keymap_toggle = '<C-t>'
let g:floaterm_keymap_kill = '<C-k>'
let g:floaterm_keymap_next = '<C-n>'
let g:floaterm_keymap_prev = '<C-p>'

" Floaterm position
let g:floaterm_title = 'terminal($1/$2)'
" let g:floaterm_width = 0.87
if winwidth(0) == 238 | let g:floaterm_width = 0.87 | else | let g:floaterm_width = 0.83 | endif
if winheight(0) == 58 | let g:floaterm_height = 0.5 | else | let g:floaterm_height = 0.4 | endif
let g:floaterm_position = 'bottomright'

" OmniSharp configuration settings
let g:OmniSharp_timeout = 5
let g:OmniSharp_highlight_types = 1
let g:OmniSharp_selector_ui = 'fzf'
" let g:OmniSharp_selector_findusages = 'fzf'
" let g:OmniSharp_selector_gotodefinition = 'fzf'
let g:OmniSharp_popup = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_popup_options = {
\ 'winblend': 30,
\ 'winhl': 'Normal:Normal,FloatBorder:Special',
\ 'border': 'rounded'
\}

" Show type information automatically when the cursor stops moving.
" Note that the type is echoed to the Vim command line, and will overwrite
" any other messages in this space including e.g. ALE linting messages.
autocmd CursorHold *.cs OmniSharpTypeLookup

autocmd FileType cs nmap <silent> <Leader>st :OmniSharpStartServer<CR>
autocmd FileType cs nmap <silent> <Leader>re :OmniSharpRestartServer<CR>
autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nmap <silent> <Leader>pd :OmniSharpPreviewDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <silent> <buffer> <Leader>pi :OmniSharpPreviewImplementations<CR>
autocmd FileType cs nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>

" Setup OmniSharp test debug with VimSpector
autocmd FileType cs nmap <silent><C-ra> :OmniSharpRunTestsInFile<CR>
autocmd FileType cs nmap <silent><C-rt> :OmniSharpRunTest<CR>
autocmd FileType cs nmap <silent><C-dt> :OmniSharpDebugTest<CR>
autocmd FileType cs nmap <silent><C-cd> :OmniSharpCreateDebugConfig<CR>
autocmd FileType cs nmap <silent><C-rd> :OmniSharpDebugProject<CR>

autocmd FileType ts nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
autocmd FileType html nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>

" Emmet enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" The following commands are contextual, based on the cursor position.
" autocmd FileType cs nnoremap <buffer>
" autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
inoremap <expr> <c-y> pumvisible() ? "\<c-y>" : "\<c-x>\<c-o>\<c-y>"

" Vim-maximizer key config
nnoremap <silent><F11> :MaximizerToggle<CR>
vnoremap <silent><F11> :MaximizerToggle<CR>gv
inoremap <silent><F11><C-o> :MaximizerToggle<CR>

" Vimspector customize key shortcuts
nnoremap <Leader>dl :call vimspector#Launch()<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>tb :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>cb :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>di <Plug>VimspectorBalloonEval
nmap <Silent>dr <Plug>VimspectorRestart
nmap <Leader>su <Plug>VimspectorStepOut
nmap <Leader>si <Plug>VimspectorStepInto
nmap <Leader>so <Plug>VimspectorStepOver

" Vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" Settings: {{{
filetype indent plugin on
if !exists('g:syntax_on') | syntax enable | endif
set encoding=utf-8
scriptencoding utf-8

set completeopt=menuone,noinsert,noselect,preview

set backspace=indent,eol,start
set expandtab
set shiftround
set softtabstop=-1
set textwidth=80
set title
set showcmd

" Specific tab widths
set tabstop=4 
set shiftwidth=4
autocmd FileType json set tabstop=4 shiftwidth=4
autocmd FileType js set tabstop=4 shiftwidth=4

" TextEdit might fail if hidden is not set.
set hidden
set nofixendofline
set nostartofline
set splitbelow
set splitright
set hlsearch
set incsearch
set laststatus=2
set noruler
set noshowmode
set signcolumn=yes
set number
set relativenumber
set mouse=a
set updatetime=1000

" Some servers have issues with backup files: coc.nvim
set nobackup
set nowritebackup

" NerdTree configuration modifiable
:set ma

" NERDTree auto refresh
" Link: https://superuser.com/questions/1141994/autorefresh-nerdtree
autocmd BufEnter NERD_tree_* | execute 'normal R'
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:vimspector_enable_mappings = 'HUMAN'
let g:airline_powerline_fonts=1
let g:tmuxline_powerline_separators = 0

" set background=dark
" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme edge`.
let g:edge_style = 'default'
let g:edge_better_performance = 1
let g:edge_dim_foreground = 1
let g:edge_enable_italic = 1
let g:edge_diagnostic_text_highlight = 1
let g:edge_diagnostic_virtual_text = 'colored'

colorscheme edge
" colorscheme onedark
let g:airline_theme = 'edge'
" let g:airline_theme = 'onedark'
let g:airline#extensions#tmuxline#enabled = 0

set clipboard+=unnamedplus
" Move Swap Directory to something temporary.
set directory^=$HOME/tempswap//

" This directory should exist.
" Always enable preview window on the right with 75% width
let g:fzf_preview_window = 'right:70%'

" vim wiki settings.
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" ctrl+p when you move to a file this highlights it.
let g:nerdtree_sync_cursorline = 1

" Coc config
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <Leader>ca <Plug>(coc-codelens-action)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

let g:coc_snippet_next = '<Tab>'

" Ale config
let g:ale_linters_ignore = {
      \   'typescript': ['tslint'],
      \}

let g:ale_fixers = {
\ 'html': ['prettier'],
\ 'css': ['stylelint'],
\ 'rust': ['rustc', 'rls'],
\}

let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'html': ['htmlhint'],
\ 'css': ['stylelint'],
\ 'rust': ['rustc', 'rls'],
\}

" Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 1
let g:ale_set_signs = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

:autocmd VimEnter * hi SpellBad cterm=undercurl gui=undercurl
:autocmd VimEnter * hi SpellCap cterm=undercurl gui=undercurl
:autocmd VimEnter * hi ALEWarning cterm=undercurl ctermbg=54 gui=undercurl guibg=None guisp=#a87311

" Sass scss auto compile
autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"

" NERD Commenter setting
" Create default mappings
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Auto-refresh file
if ! exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
    silent! checktime
    call timer_start(1000,'CheckUpdate')
endfunction

" Indent line config
let g:indentLine_faster = 1
let g:indentLine_setConceal = 0

