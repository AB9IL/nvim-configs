return {
    'mfussenegger/nvim-lint',
    -- Linting tool
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            go = { "golangcilint" },
            html = { "tidy" },
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            json = { "jsonlint" },
            lua = { "luacheck" },
            markdown = { "markdownlint" },
            python = { "ruff" },
            ruby = { "ruby" },
            sh = { "shellcheck" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            xml = { "tidy" },
            yaml = { "yamllint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
