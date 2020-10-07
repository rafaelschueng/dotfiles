" Rafael Schueng personal nvim config file.
" Please. see: 'github.com/rafaelschueng/dotfiles' for more information

"VIM OPTIONS
set title
set number
set hidden
set cmdheight=1
set updatetime=1000

"set expand and compatible modes
set nocompatible
set expandtab

"Set tabstops and shiftwidth
set tabstop=2
set shiftwidth=2

"Configure terminal based colors
set termguicolors
syntax on

" POWERLINE CONFIGURATION FOR VIM-AIRLINE
let g:airline_powerline_fonts = 1

" check if gui is running
if has('gui_running')
    colorscheme onedark
    set guioptions-=T
    set guioptions-=r
    set laststatus=2
    if has('gui_gtk2')
        set guifont=Fira\ Mono\ Bold\ 10
    endif
endif

" end of personal configs
" be iMproved, required

filetype off

" PLUG.VIM Configuration script block

call plug#begin(stdpath('data'))
  
  "COC - Conquer of Completion. Syntax intelisense
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  "NERDTree folder navigation plugin
  Plug 'preservim/nerdtree'

  "AILINE AND AIRLINE THEMES
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " VIM DEVICONS
  Plug 'ryanoasis/vim-devicons'

  " OMNISHARP FOR VIM
  Plug 'OmniSharp/omnisharp-vim'

  "VIM POLYGLOT
  Plug 'sheerun/vim-polyglot'

  "VIM SURROUND
  Plug 'tpope/vim-surround'

  "VIM ONEDARK THEME
  Plug 'joshdick/onedark.vim'

call plug#end()

"Set colorscheme after set all configs
colorscheme onedark

