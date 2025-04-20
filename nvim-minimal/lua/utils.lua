-- status line
-- Clear the statusline for when the configuration is reloaded
vim.o.statusline = ""

-- Define status bar colors
vim.api.nvim_command("hi! NormalColor guifg=#50DD6A guibg=#262626 ctermfg=Grey ctermbg=Black")
vim.api.nvim_command("hi! InsertColor guifg=#5080DD guibg=#262626 ctermfg=Blue ctermbg=Black")
vim.api.nvim_command("hi! ReplaceColor guifg=#DD4040 guibg=#262626 ctermfg=Red ctermbg=Black")
vim.api.nvim_command("hi! VisualColor guifg=#DD40DD guibg=#262626 ctermfg=Magenta ctermbg=Black")
vim.api.nvim_command("hi! CommandColor guifg=#CCCCDD guibg=#262626 ctermfg=Magenta ctermbg=Black")

-- Set the statusline
vim.o.statusline = table.concat({
    "%#NormalColor#%{mode()=='n'?' NORMAL ':''}",
    "%#InsertColor#%{mode()=='i'?' INSERT ':''}",
    "%#ReplaceColor#%{mode()=='R'?' REPLACE ':''}",
    "%#VisualColor#%{mode()=='v'?' VISUAL ':''}",
    "%#VisualColor#%{mode()==''?' VISUAL ':''}",
    "%#CommandColor#%{mode()=='c'?' COMMAND ':''}",
    "%3n",  -- buffer number
    " %f",  -- file name
    " %h%m%r%w",  -- flags
    " %= ",  -- right align
    "%{&fileformat} | ",  -- file format
    "%{strlen(&fenc)?&fenc:&enc} | ",  -- encoding
    "%{strlen(&ft)?&ft:'none'} ",  -- filetype
    "%<%p%% ",  -- position
    "%-4.(%l:%c%) ",  -- offset
}, "")
