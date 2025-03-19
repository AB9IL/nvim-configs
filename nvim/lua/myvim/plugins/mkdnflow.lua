return {
    'jakewvincent/mkdnflow.nvim',
    -- Markdown note taking tool
    opts = {
      rocks = "luautf8",
    },
    config = function()
      require('mkdnflow').setup({
        rocks = "luautf8",
      })
    end,
  }
