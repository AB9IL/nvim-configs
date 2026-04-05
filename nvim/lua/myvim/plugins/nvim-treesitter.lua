return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main", -- Required for 0.12
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		-- List of parsers to install
		local languages = {
			"bash",
			"comment",
			"css",
			"csv",
			"html",
			"ini",
			"javascript",
			"lua",
			"markdown",
			"markdown_inline",
			"perl",
			"php",
			"python",
			"regex",
			"rst",
			"ruby",
			"toml",
			"typescript",
			"xml",
			"yaml",
		}

		-- Initialize the plugin
		ts.setup()

		-- Install the specified parsers
		ts.install(languages)

		-- Enable features per-filetype with an autocmd
		local group = vim.api.nvim_create_augroup("TreesitterFeatures", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = languages,
			callback = function()
				-- Enable syntax highlighting
				vim.treesitter.start()
				-- Enable indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				-- Enable folding
				-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- vim.wo.foldmethod = "expr"
			end,
		})
	end,
}
