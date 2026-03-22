return {
  "tree-sitter-grammars/tree-sitter-markdown",
  -- Markdown parser for Treesitter

  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      ensure_installed = { "markdown", "markdown_inline" },
    })
  end,
}
