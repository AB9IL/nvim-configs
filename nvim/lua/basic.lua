--Set leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--General Settings
vim.opt.backup = false
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }
vim.opt.colorcolumn = '80'
vim.opt.complete = vim.opt.complete + 'kspell'
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.conceallevel = 2
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fillchars = { diff = ' ', eob = ' ', fold = ' ', horiz = '━',
  horizup  = '┻', horizdown = '┳', vert = '┃', vertleft  = '┫',
  vertright = '┣', verthoriz = '╋' }
vim.opt.hidden = true
vim.opt.history = 500
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'nosplit'
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.listchars = {tab = '▸ ', trail = '·'}
vim.opt.mouse = 'a'
vim.opt.pastetoggle='<F2>'
vim.opt.path = vim.opt.path + '.,**'
vim.opt.ruler = true
vim.opt.scrolloff = 8
vim.opt.shell = '/bin/bash'
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.spelllang = {'en', 'cjk'}
vim.opt.spell = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.textwidth = 0
vim.opt.title = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'
vim.opt.updatetime = 500
vim.opt.wildmode = 'list:longest'
vim.opt.wrap = false
vim.opt.wrapmargin = 0

-- buffer-local
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.undofile = true

-- window-local
vim.opt.termguicolors = true
vim.opt.breakindent = true
vim.opt.number = true
vim.opt.signcolumn = 'yes'

-- Python version
vim.g.python3_host_prog = '/usr/bin/python3'

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false
