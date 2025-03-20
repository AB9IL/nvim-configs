return {
    "echasnovski/mini.nvim",
    version = '*',
    lazy = false,
    opts = {},
    config = function()
        require("mini.ai").setup({})
        require("mini.bracketed").setup({})
        require("mini.clue")
        local miniclue = require('mini.clue')
        miniclue.setup({
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },
                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },
                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },
                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },
                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },
                -- Window commands
                { mode = 'n', keys = '<C-w>' },
                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },
            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },
        })
        require('mini.clue').setup({})
        require("mini.comment").setup({})
        require("mini.completion").setup({})
        require("mini.diff").setup({})
        require("mini.extra").setup({})
        require("mini.files").setup({
            mappings = {
                show_help = "gh",
                close = "<esc>",
            },
        })
        require("mini.fuzzy").setup({})
        require("mini.git").setup({})
        require("mini.hipatterns").setup({})
        require("mini.icons").setup({})
        require("mini.notify").setup({})
        require("mini.operators").setup({})
        require("mini.pairs").setup({})
        require("mini.pick").setup({})
        require("mini.statusline").setup({})
        require("mini.surround").setup({})
        require("mini.tabline").setup({})
            vim.api.nvim_set_hl(0, 'MiniTablineVisible', { fg = '#606070', bg = '#202020' })
            vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { fg = '#00DDDD', bg = '#202020' })
            vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { fg = '#976300', bg = '#202020' })
            vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { fg = '#8E5D00', bg = '#202020' })
            vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { fg = '#DD9100', bg = '#202020' })
        -- for statusline
        local statusline = require('mini.statusline')
        -- Define the content for the active window
        local function active_content()
            local mode = statusline.section.mode.get()
            local git = statusline.section.git.get()
            local diagnostics = statusline.section.diagnostics.get()
            local file_info = statusline.section.fileinfo.get()
            local location = statusline.section.location.get()

            return table.concat({ mode, ' ', git, ' ', diagnostics, ' ', file_info, ' ', location })
        end
        -- Define the content for the inactive window
        local function inactive_content()
            local file_info = statusline.section.fileinfo.get()
            return file_info
        end
        -- Set up the statusline
        statusline.setup({
            content_hooks = {
                active = active_content,
                inactive = inactive_content,
            },
            set_vim_settings = true,
        })
        -- Define highlight group colors
        vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { fg = '#50DD6A', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', { fg = '#5080DD', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual', { fg = '#DD00DD', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniStatuslineModeReplace', { fg = '#DD4040', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniStatuslineModeCommand', { fg = '#CCCCDD', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { fg = '#CCCCDD', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { fg = '#CCCCDD', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniStatuslineDiagnostics', { fg = '#DD4040', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniStatuslineGit', { fg = '#50DD6A', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniStatuslineLocation', { fg = '#CCCCDD', bg = '#202020' })
        vim.api.nvim_set_hl(0, 'MiniHipatternsFixme', { fg = '#DD4040', bg = '#000000' })
        vim.api.nvim_set_hl(0, 'MiniHipatternsHack', { fg = '#5080DD', bg = '#000000' })
        vim.api.nvim_set_hl(0, 'MiniHipatternsTodo', { fg = '#DD00DD', bg = '#000000' })
        vim.api.nvim_set_hl(0, 'MiniHipatternsNote', { fg = '#00DDDD', bg = '#000000' })
        -- for hipatterns
        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({
        highlighters = {
            -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
            fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
            todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
            note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
        })
    end,
}
