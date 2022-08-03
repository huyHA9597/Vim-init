" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Terminal in neovim
    Plug 'voldikss/vim-floaterm'

    " OmniSharp syntax
    Plug 'OmniSharp/omnisharp-vim', {'for':['cs','csx','cshtml.html','csproj','solution'], 'on': ['OmniSharpInstall']}
    Plug 'nickspoons/vim-sharpenup'

    " Nvim treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'windwp/nvim-ts-autotag'

    " HTML Snippet
    Plug 'adriaanzon/vim-emmet-ultisnips'
    Plug 'valloric/MatchTagAlways'
    Plug 'jiangmiao/auto-pairs'

    " Rust syntax
    Plug 'rust-lang/rust.vim'
    " Plug 'arzg/vim-rust-syntax-ext'

    " Plug indent line
    Plug 'lukas-reineke/indent-blankline.nvim'

    " Comment
    Plug 'preservim/nerdcommenter'

    " Bracey - live server
    Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

    " Auto completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Debug and test
    Plug 'puremourning/vimspector'
    Plug 'vim-test/vim-test'

    " Linting/error highlighting
    Plug 'dense-analysis/ale'

    " Snippet support
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Fuzzy Search + Ripgrep for search files
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'kyoh86/vim-ripgrep'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-rhubarb'
    Plug 'lewis6991/gitsigns.nvim'

    " Nvim-pqf
    Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
    
    " TODO Comment
    Plug 'folke/todo-comments.nvim'

    " For Lua plugin 
    Plug 'nvim-lua/plenary.nvim'

    " Colorscheme
    Plug 'sainnhe/edge'
    Plug 'tomasiser/vim-code-dark'
    Plug 'joshdick/onedark.vim'

    " Statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Smooth movement cursor
    Plug 'psliwka/vim-smoothie'

    " DevIcons - always load at the end
    Plug 'ryanoasis/vim-devicons'

call plug#end()

