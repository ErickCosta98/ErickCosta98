set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:syntax enable
:set showmatch
:set noswapfile
:set incsearch
:set nofixendofline
:set termguicolors
:set hidden



call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
"::#Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'marlonfan/coc-phpls'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'  " Dependency for Telescope
Plug 'neovim/nvim-lspconfig'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
\ }
Plug 'StanAngeloff/php.vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'NeogitOrg/neogit'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'andymass/vim-matchup'
Plug 'preservim/nerdcommenter'
set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme onedark

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippetos
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = 'Line'

set clipboard+=unnamedplus
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
augroup RainbowDisableInNERDTree
  autocmd!
  autocmd FileType nerdtree let b:rainbow_active = 0
augroup END

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
abbrev </ </<C-X><C-O>
lua << EOF
local neogit = require('neogit')
neogit.setup {}
EOF
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
