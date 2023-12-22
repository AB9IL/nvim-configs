-- Set up key remaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local opts_f = { noremap = false, silent = true }

-- Seamlessly treat visual lines as actual lines when moving around.
keymap('', 'j', 'gj', opts)
keymap('', 'k', 'gk', opts)
keymap('', '<Down>', 'gj', opts)
keymap('', '<Up>', 'gk', opts)
keymap('i', '<Down>', '<C-o>gj', opts)
keymap('i', '<Up>', '<C-o>gk', opts)

-- Navigate tabs
keymap('', 'tt', ':tabnew<CR>', opts)
keymap('', '<M-Right>', ':tabn<CR>', opts)
keymap('i', '<M-Right>', '<ESC>:tabn<CR>', opts)
keymap('', '<M-Left>', ':tabp<CR>', opts)
keymap('i', '<M-Left>', '<ESC>:tabp<CR>', opts)

-- Navigate around splits with a single key combo.
keymap('n', '<C-l>', '<C-w><C-l>', opts)
keymap('n', '<C-h>', '<C-w><C-h>', opts)
keymap('n', '<C-k>', '<C-w><C-k>', opts)
keymap('n', '<C-j>', '<C-w><C-j>', opts)

-- Cycle through buffers in normal mode.
keymap('n', '<Tab>', ':bnext<cr>', opts)
keymap('n', '<S-Tab>', ':bprev<cr>', opts)

-- Manually toggle Netrw
keymap('n', '<leader>n', ':Lexplore<CR>', opts)

-- Navigate through popup menus in insert mode
keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true})
keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<Tab>"]], {expr = true})

-- Press * to search for the term under the cursor or a visual selection and
-- then press a key below to replace all instances of it in the current file.
keymap('n', '<Leader>r', ':%s///g', opts)
keymap('n', '<Leader>rc', ':%s///gc', opts)

-- The same as above but instead of acting on the whole file it will be
-- restricted to the previously visually selected range. You can do that by
-- pressing *, visually selecting the range you want it to apply to and then
-- press a key below to replace all instances of it in the current selection.
keymap('x', '<Leader>r', ':s///g', opts)
keymap('x', '<Leader>rc', ':s///gc', opts)

-- Type a replacement term and press . to repeat the replacement again. Useful
-- for replacing a few instances of the term (comparable to multiple cursors).
keymap('n', '<silent> s*', ':let @/="\\<".expand("<cword>")."\\>"<CR>cgn', opts)
keymap('x', '<silent> s*', '"sy:let @/=@s<CR>cgn', opts)

-- Clear search highlights.
keymap('', '<Leader><Space>', ':let @/=""<CR>', opts)
keymap('n', '//', ':noh<CR>', opts)

-- Format paragraph (selected or not) to 80 character lines.
keymap('n', '<Leader>g', 'gqap', opts)
keymap('x', '<Leader>g', 'gqa', opts)

-- Better indentation.
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Prevent x from overriding what's in the clipboard.
keymap('n', 'x', '"_x', opts)
keymap('n', 'X', '"_x', opts)

-- Prevent selecting and pasting from overwriting what you originally copied.
keymap('x', 'p', 'pgvy', opts)

-- Keep cursor at the bottom of the visual selection after you yank it.
keymap('v', 'y', 'ygv<Esc>', opts)

-- Edit Vim config file in a new tab.
keymap('', '<Leader>ev', ':tabnew $MYVIMRC<CR>', opts)

-- Source Vim config file.
keymap('', '<Leader>sv', ':source $MYVIMRC<CR>', opts)

-- Allow gf to ceate and open files
keymap('', 'gf', ':edit <cfile><CR>', opts)

-- Open the index file of notes (without Vimwiki).
-- keymap('n', '<Leader>ww', ':e ~/Documents/Vimwiki/index.md<cr>', opts)

-- Open the current file in the default program
keymap('n', '<Leader>x', ':!xdg-open %<CR><CR>', opts)

-- Toggle spell check.
keymap('', '<F5>', ':setlocal spell!<CR>', opts)

-- Toggle relative line numbers and regular line numbers.
keymap('n', '<F6>', ':set invrelativenumber<CR>', opts)

-- Toggle visually showing all whitespace characters.
keymap('', '<F7>', ':set list!<CR>', opts)
keymap('i', '<F7>', '<C-o>:set list!<CR>', opts)
keymap('c', '<F7>', '<C-c>:set list!<CR>', opts)

-- Save with Ctrl-s
keymap('n', '<C-s>', ':w<CR>', opts)
keymap('i', '<C-s>', '<ESC>:w<CR>', opts)

-- Save with sudo
keymap('c', 'w!!', 'w !sudo tee %', opts)

-- Open a terminal
keymap('n', '<C-w>t', ':terminal<CR>', opts)

-- Easy quit
keymap('n', ',q', ':q!<CR>', opts)

-- Automatically close brackets, parethesis, and quotes
keymap('i', "'", "''<left>", opts)
keymap('i', '"', '""<left>', opts)
keymap('i', '(', '()<left>', opts)
keymap('i', '[', '[]<left>', opts)
keymap('i', '{', '{}<left>', opts)
keymap('i', '{;', '{};<left><left>', opts)
keymap('i', '/*', '/**/<left><left>', opts)
