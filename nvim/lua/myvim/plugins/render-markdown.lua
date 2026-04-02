return {
    'MeanderingProgrammer/render-markdown.nvim',
    -- Markdown Renderer
    opts = {
      completions = {
          lsp = {
              enabled = true
          }
      },
      heading = {
        width = "block",
        left_pad = 2,
        right_pad = 4,
        position = "inline"
      },
      latex = {
        enabled = false
      }
    },
    config = function(_, opts)
      require('render-markdown').setup(opts)
    end,
  }
