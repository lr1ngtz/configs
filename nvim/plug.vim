call plug#begin()

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Git signs
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Nvim tree (File explorer)
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" LSP config
Plug 'neovim/nvim-lspconfig'

call plug#end()

