local g = vim.g
local o = vim.opt
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--Set leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

--General Settings
o.backup = false
o.clipboard = { "unnamed", "unnamedplus" }
o.colorcolumn = "80"
o.complete = vim.opt.complete + "kspell"
o.completeopt = { "menuone", "noinsert", "noselect" }
o.conceallevel = 2
o.encoding = "utf-8"
o.expandtab = true
o.fillchars = {
	diff = " ",
	eob = " ",
	fold = " ",
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}
o.hidden = true
o.history = 500
o.hlsearch = true
o.ignorecase = true
o.inccommand = "nosplit"
o.incsearch = true
o.laststatus = 3
o.listchars = { tab = "▸ ", trail = "·" }
o.mouse = "a"
--vim.opt.pastetoggle='<F2>'
o.path = vim.opt.path + ".,**"
o.ruler = true
o.scrolloff = 8
o.shell = "/bin/bash"
o.shiftwidth = 4
o.showmode = false
o.shortmess = vim.opt.shortmess + "c"
o.showtabline = 1
o.smartcase = true
o.smarttab = true
o.softtabstop = 4
o.spelllang = { "en", "cjk" }
o.spell = false
o.splitbelow = true
o.splitright = true
o.tabstop = 4
o.textwidth = 0
o.title = true
o.undofile = true
o.undodir = vim.fn.stdpath("config") .. "/undo"
o.updatetime = 500
o.wildmode = "list:longest"
o.wrap = false
o.wrapmargin = 0

-- buffer-local
o.autoindent = true
o.expandtab = true
o.shiftround = true
o.shiftwidth = 4
o.smartindent = true
o.swapfile = false
o.tabstop = 4
o.undofile = true

-- window-local
o.termguicolors = true
o.breakindent = true
o.number = true
o.signcolumn = "yes"

-- Python version
g.python3_host_prog = "/usr/bin/python3"

--Map blankline
g.indent_blankline_char = "┊"
g.indent_blankline_filetype_exclude = { "help", "packer" }
g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
g.indent_blankline_char_highlight = "LineNr"
g.indent_blankline_show_trailing_blankline_indent = false

--netrw file manager
g.netrw_banner = 0
g.netrw_winsize = 25

--general config commands
-- remove trailing whitespaces
autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})
-- Run xrdb whenever Xdefaults or Xresources are updated.
autocmd("BufWritePost", {
	pattern = "X{resources,defaults}",
	command = ":silent !xrdb %",
})
-- Update binds when sxhkdrc is updated.
autocmd("BufWritePost", {
	pattern = "*sxhkdrc",
	command = ":!pkill -USR1 sxhkd",
})
-- Set filetype syntax and behavior
autocmd(
	{ "BufNewFile", "BufRead" },
	{
		pattern = {
			"*.markdown",
			"*.mdown",
			"*.mkd",
			"*.mdwn",
			"*.md",
			"*-outline",
			"*-manuscript",
		},
		command = "set ft=markdown wrap linebreak nolist",
	}
)
autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = { "*.txt", "*.text", "*.log" }, command = "set ft=text wrap linebreak nolist" }
)
autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = { "conf", "config", "*.conf", "*.log", "*rc", "*.rc", "*.strm", "*.xspf" }, command = "set ft=config" }
)
-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({
			higroup = (vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"),
			timeout = "200",
		})
	end,
})
