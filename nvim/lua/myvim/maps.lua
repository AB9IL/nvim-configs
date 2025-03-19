vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Seamlessly treat visual lines as actual lines when moving around.
map("", "j", "gj")
map("", "k", "gk")
map("", "<Down>", "gj")
map("", "<Up>", "gk")
map("i", "<Down>", "<C-o>gj")
map("i", "<Up>", "<C-o>gk")

-- Navigate tabs
map("", "tt", ":tabnew<CR>")
map("", "<M-Right>", ":tabn<CR>")
map("i", "<M-Right>", "<ESC>:tabn<CR>")
map("", "<M-Left>", ":tabp<CR>")
map("i", "<M-Left>", "<ESC>:tabp<CR>")

-- Navigate around splits with a single key combo.
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-j>", "<C-w><C-j>")

-- Cycle through buffers in normal mode.
map("n", "<Tab>", ":bnext<cr>")
map("n", "<S-Tab>", ":bprev<cr>")

-- Manually toggle Netrw
-- keymap("n", "<leader>n", ":Lexplore<CR>")

-- Navigate through popup menus in insert mode
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<Tab>"]], { expr = true })

-- Press * to search for the term under the cursor or a visual selection and
-- then press a key below to replace all instances of it in the current file.
map("n", "<Leader>r", ":%s///g")
map("n", "<Leader>rc", ":%s///gc")

-- The same as above but instead of acting on the whole file it will be
-- restricted to the previously visually selected range. You can do that by
-- pressing *, visually selecting the range you want it to apply to and then
-- press a key below to replace all instances of it in the current selection.
map("x", "<Leader>r", ":s///g")
map("x", "<Leader>rc", ":s///gc")

-- Type a replacement term and press . to repeat the replacement again. Useful
-- for replacing a few instances of the term (comparable to multiple cursors).
map("n", "<silent> s*", ':let @/="\\<".expand("<cword>")."\\>"<CR>cgn')
map("x", "<silent> s*", '"sy:let @/=@s<CR>cgn')

-- Clear search highlights.
map("", "<Leader><Space>", ':let @/=""<CR>')
map("n", "//", ":noh<CR>")

-- Format paragraph (selected or not) to 80 character lines.
map("n", "<Leader>g", "gqap")
map("x", "<Leader>g", "gqa")

-- Better indentation.
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Prevent x from overriding what's in the clipboard.
map("n", "x", '"_x')
map("n", "X", '"_x')

-- Prevent selecting and pasting from overwriting what you originally copied.
map("x", "p", "pgvy")

-- Keep cursor at the bottom of the visual selection after you yank it.
map("v", "y", "ygv<Esc>")

-- Edit Vim config file in a new tab.
map("", "<Leader>ev", ":tabnew $MYVIMRC<CR>")

-- Source Vim config file.
map("", "<Leader>sv", ":source $MYVIMRC<CR>")

-- Allow gf to ceate and open files
map("", "gf", ":edit <cfile><CR>")

-- Open the index file of notes (without Vimwiki).
-- keymap('n', '<Leader>ww', ':e ~/Documents/Vimwiki/index.md<cr>')

-- Open the current file in the default program
map("n", "<Leader>x", ":!xdg-open %<CR><CR>")

-- Toggle spell check.
map("", "<F5>", ":setlocal spell!<CR>")

-- Toggle relative line numbers and regular line numbers.
map("n", "<F6>", ":set invrelativenumber<CR>")

-- Toggle visually showing all whitespace characters.
map("", "<F7>", ":set list!<CR>")
map("i", "<F7>", "<C-o>:set list!<CR>")
map("c", "<F7>", "<C-c>:set list!<CR>")

-- Save with Ctrl-s
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<ESC>:w<CR>")

-- Save with sudo
map("c", "w!!", "w !sudo tee %")

-- Easy quit
map("n", ",q", ":q!<CR>")
