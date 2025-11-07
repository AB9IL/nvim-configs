return {
  'neovim/nvim-lspconfig',
  opts = {},
  config = function()
    -- Assign the diagnostic signs using vim.diagnostic.config()
    vim.diagnostic.config({
        virtual_text = true,
        signs = {
            text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
            },
        },
      update_in_insert = false,
      underline = true,
      severity_sort = true,
    })
    vim.lsp.config('harper_ls', {
        settings = {
            ["harper-ls"] = {
            linters = {
                SentenceCapitalization = false,
                SpellCheck = false,
            }
            }
        },
    })
    vim.lsp.enable('harper_ls')
  end,
}
