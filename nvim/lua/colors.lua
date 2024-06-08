-- color scheme
vim.cmd('syntax enable')
vim.cmd('hi Normal gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE')
vim.cmd('hi EndOfBuffer guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE')
vim.opt.background = 'dark'
vim.cmd('colorscheme material-deep-ocean')
vim.cmd('hi clear LineNr')
vim.cmd('hi clear SignColumn')
vim.cmd('hi! link markdownItalic Italic')
vim.cmd('hi! link markdownBold Bold')
vim.cmd('hi! WinSeparator ctermbg=NONE ctermfg=DarkGrey guibg=NONE guifg=#0791D1')
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.cmd('hi Search ctermbg=DarkGrey ctermfg=Black cterm=bold guifg=#CCCCDD guibg=#86868C')
vim.cmd('hi Visual ctermbg=DarkGrey ctermfg=Black cterm=bold guifg=#CCCCDD guibg=#86868C')
vim.cmd('hi Colorcolumn ctermbg=Grey cterm=bold guibg=#303030')
vim.cmd('hi Cursorline ctermbg=Grey cterm=bold guibg=#303030')
vim.cmd('hi Cursorcolumn ctermbg=Grey cterm=bold guibg=#303030')
vim.cmd('hi HighlightedyankRegion ctermfg=Black ctermbg=Yellow cterm=bold guifg=#000000 guibg=#9CE342')
vim.cmd('hi clear SpellBad')
vim.cmd('hi clear SpellCap')
vim.cmd('hi clear SpellRare')
vim.cmd('hi SpellBad cterm=undercurl guisp=Red gui=undercurl')
vim.cmd('hi SpellCa cterm=undercurl guisp=Yellow gui=undercurl')
vim.cmd('hi SpellRar cterm=undercurl guisp=Blue gui=undercurl')

--for Material theme:
require('material').setup({
    material_style = 'deep ocean',
    lualine_style = 'stealth'
})

