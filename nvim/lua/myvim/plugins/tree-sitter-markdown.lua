return {
	"tree-sitter-grammars/tree-sitter-markdown",
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup()
		-- Explicitly install the markdown parsers
		ts.install({ "markdown", "markdown_inline" })
	end,
}
