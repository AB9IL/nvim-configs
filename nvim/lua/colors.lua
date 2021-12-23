-- color scheme
vim.cmd([[syntax enable]])
vim.opt.background = 'dark'
vim.cmd('colorscheme moonfly')
vim.cmd([[hi clear LineNr]])
vim.cmd([[hi clear SignColumn]])
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi EndOfBuffer guibg=NONE ctermbg=NONE]])
vim.cmd([[hi! link markdownItalic Italic]])
vim.cmd([[hi! link markdownBold Bold]])
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.cmd([[hi Cursorline ctermbg=Yellow cterm=bold guibg=#2b2b2b]])
vim.cmd([[hi Cursorcolumn ctermbg=Yellow cterm=bold guibg=#2b2b2b]])
