-- Regenerate compiled loader file
-- :PackerCompile
-- Remove any disabled or unused plugins
-- :PackerClean
-- Clean, then install missing plugins
-- :PackerInstall
-- Clean, then update and install plugins
-- :PackerUpdate
-- Perform "PackerUpdate" and then "PackerCompile"
-- :PackerSync
return require('packer').startup({function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'MDeiml/tree-sitter-markdown' -- markdown parser for tree-sitter
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- source for neovim builtin LSP client
    use 'hrsh7th/cmp-path' --completion source for paths
    use 'hrsh7th/cmp-buffer' --completion source for buffer words
    use 'jose-elias-alvarez/null-ls.nvim' -- hook non-LSP sources to the client
    use 'lewis6991/gitsigns.nvim' -- git decorations
    use 'onsails/lspkind-nvim' -- icons for lsp functions
    use 'fisadev/vim-isort' -- sort Python modules
    use 'kyazdani42/nvim-web-devicons' -- dev icons with colors
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    use 'norcalli/nvim-colorizer.lua' -- colorizer
    -- Color schemes
    use 'rktjmp/lush.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'kyazdani42/nvim-palenight.lua'
    use 'marko-cerovac/material.nvim'
    use 'navarasu/onedark.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'Shatur/neovim-ayu'
    use 'ishan9299/nvim-solarized-lua'
    use 'nvim-lualine/lualine.nvim' -- status line in lua
    --- Markdown supports
    use 'ellisonleao/glow.nvim' -- Preview within Neovim
    use 'vimwiki/vimwiki' -- note taking tool
end,
config = {git = {clone_timeout = 360}}})
