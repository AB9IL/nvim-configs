-- remove trailing whitespaces
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
-- remove trailing newline
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])
-- Run xrdb whenever Xdefaults or Xresources are updated.
vim.cmd([[autocmd BufWritePost *xresources !xrdb %]])
-- Update binds when sxhkdrc is updated.
vim.cmd([[autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd]])
-- Prevent resize glitch on open
vim.cmd([[autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"]])
-- Set filetype syntax and behavior
vim.cmd([[autocmd BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mdwn,*md set ft=markdown]])
vim.cmd([[autocmd BufNewFile,BufRead conf,config,*.conf,*.strm,*.xspf set ft=config]])
vim.cmd([[autocmd BufRead,BufNewFile *.wiki set ft=vimwiki]])

-- Highlight on yank
vim.cmd ([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
