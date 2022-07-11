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

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Terminal in neovim
    Plug 'voldikss/vim-floaterm'

    " OmniSharp syntax
    Plug 'OmniSharp/omnisharp-vim', {'for':['cs','csx','cshtml.html','csproj','solution'], 'on': ['OmniSharpInstall']}
    Plug 'nickspoons/vim-sharpenup'

    " HTML Snippet
    Plug 'adriaanzon/vim-emmet-ultisnips'
    Plug 'valloric/MatchTagAlways'
    Plug 'jiangmiao/auto-pairs'

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
    Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }

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

    " Nvim-pqf
    Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'

    " Colorscheme
    Plug 'EvitanRelta/vim-colorschemes'
    Plug 'sainnhe/edge'
    Plug 'joshdick/onedark.vim'

    " Statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " DevIcons - always load at the end
    Plug 'ryanoasis/vim-devicons'

call plug#end()

