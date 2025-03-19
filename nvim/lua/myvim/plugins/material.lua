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
	})
    -- set the style
    vim.g.material_style = "deep ocean"
    end,
}
