return {
    "marko-cerovac/material.nvim",
    -- Color scheme
    config = function()
    require('material').setup({
        lualine_style = "stealth",
        async_loading = true,
        plugins = { },
        high_visibility = {
            darker = false
        },
        disable = {
            background = true
        },
        custom_highlights = {
                Comment = { fg = "#606060", italic = true },
                Search = { fg = "#202020", bg = "#5775E4" },
            },
	})
    -- set the style
    vim.g.material_style = "deep ocean"
    end,
}
