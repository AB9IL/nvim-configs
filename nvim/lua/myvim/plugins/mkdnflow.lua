return {
    'jakewvincent/mkdnflow.nvim',
    -- Markdown note taking tool
    opts = {
      rocks = "luautf8",
    },
    config = function(_, opts)
      require('mkdnflow').setup(opts)
    end,
  }
