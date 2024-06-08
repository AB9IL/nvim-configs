local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	checker = { enabled = false, notify = false }, -- automatically check for plugin updates
	git = { timeout = 300 },
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"MDeiml/tree-sitter-markdown", -- markdown parser for tree-sitter
	"hiphish/rainbow-delimiters.nvim", -- distinguish delimiters based on color
	"neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-nvim-lsp", -- source for neovim builtin LSP client
	"hrsh7th/cmp-path", --completion source for paths
	"hrsh7th/cmp-buffer", --completion source for buffer words
	"stevearc/conform.nvim",
	opts = {}, event = { "BufReadPre", "BufNewFile" }, -- formatter
	"mfussenegger/nvim-lint",
	"lewis6991/gitsigns.nvim", -- git decorations
	"onsails/lspkind-nvim", -- icons for lsp functions
	"kyazdani42/nvim-web-devicons", -- dev icons with colors
	"terrortylor/nvim-comment", -- "gc" to comment visual regions/lines
	"norcalli/nvim-colorizer.lua", -- colorizer
	"rktjmp/lush.nvim", -- Color scheme
	"marko-cerovac/material.nvim", -- Color scheme
	"Shatur/neovim-ayu", -- Color scheme
	"nvim-lualine/lualine.nvim", -- Status line
	"ellisonleao/glow.nvim", -- Markdown preview within Neovim
	"jakewvincent/mkdnflow.nvim", -- Markdown note taking tool
})
