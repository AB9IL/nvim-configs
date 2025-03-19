return {
    "MDeiml/tree-sitter-markdown",
    -- markdown parser for tree-sitter

    require("nvim-treesitter.configs").setup({
        highlight = {
            enable = true,
        },
        parser = {
            markdown = {
                enable = true,
            },
        },
    }),
}
