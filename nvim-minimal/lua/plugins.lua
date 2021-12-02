-- color scheme
vim.cmd([[syntax enable]])
vim.opt.background = 'dark'
vim.cmd('colorscheme evening')
vim.cmd([[hi clear LineNr]])
vim.cmd([[hi clear SignColumn]])
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi EndOfBuffer guibg=NONE ctermbg=NONE]])
vim.cmd([[hi! link markdownItalic Italic]])
vim.cmd([[hi! link markdownBold Bold]])
vim.opt.termguicolors = true      

