set noerrorbells 
set nohlsearch 
set scrolloff=8 
syntax on 
set autoindent 
set showmatch 
let python_highlight_all=1 
syntax on 
set laststatus=2 
set nocompatible 

call plug#begin()
Plug 'jez/vim-better-sml'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/mason.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'morhetz/gruvbox'
Plug 'EdenEast/nightfox.nvim'
Plug 'lervag/vimtex'
Plug 'habamax/vim-godot'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'numToStr/Comment.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mfussenegger/nvim-jdtls'
Plug 'vim-airline/vim-airline'  
Plug 'vim-airline/vim-airline-themes'  
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'tribela/vim-transparent'
call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
    \ }

colorscheme gruvbox

highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none

command! -nargs=1 ExportCitation execute 'read' <q-args> | execute 'silent !rm' <q-args>


lua <<EOF
require "user.lsp"
require "user.cmp"
require "user.keymaps"
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
EOF



