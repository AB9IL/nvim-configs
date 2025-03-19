return {
    "nvim-treesitter/nvim-treesitter",
    -- Smart syntax highlighting
    -- Parsers must be installed manually via :TSInstall
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
        ensure_installed = {
            "bash",
            "comment",
            "css",
            "csv",
            "html",
            "javascript",
            "lua",
            "markdown",
            "markdown_inline",
            "perl",
            "php",
            "python",
            "regex",
            "ruby",
            "typescript",
            "xml",
            "yaml",
        },
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = { "" }, -- list of languages to disable
            additional_vim_regex_highlighting = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },

        rainbow = {
                enable = true,
                disable = { "html" },
                extended_mode = false,
                max_file_lines = nil,
            },
        },
        indent = {
            enable = true,
            disable = "html",
        },
    })
end,
}
