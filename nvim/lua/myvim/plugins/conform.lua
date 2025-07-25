return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
            require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
        go = { "gofmt" },
        python = { "ruff_format","ruff_organize_imports" },
        lua = { "stylua" },
        sh = { "shfmt", "shellcheck" },
        css = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        json = { "prettierd" },
        markdown = { "prettierd" },
        perl = { "prettierd" },
        toml = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        yaml = { "prettierd" },
        },
        -- Set default options
        default_format_opts = {
        lsp_format = "fallback",
        },
        -- Set up format-on-save
        format_on_save = { timeout_ms = 1000 },
        -- Customize formatters
        formatters = {
        shfmt = {
            prepend_args = { "-i", "2" },
        },
        },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
