return {
  url = "https://codeberg.org/mraspaud/smellycat.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("smellycat").setup()   -- all smells enabled with sensible defaults
  end,
}
