local Plug = vim.fn['plug#']

vim.g.vim_plug_just_installed = '0'
-- check for vim-plug
vim.cmd([[
 let vim_plug_path = expand("~/.config/nvim/autoload/plug.vim")
 if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
 endif
 " manually load vim-plug the first time
 if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
 endif]])

vim.call('plug#begin', '~/.config/nvim/plugged')
   Plug('nvim-lua/popup.nvim')
   Plug('nvim-lua/plenary.nvim')
   Plug('nvim-telescope/telescope.nvim')
   Plug('nvim-telescope/telescope-fzf-native.nvim',
   { ['do'] = function()
       vim.call('make')
   end })
   Plug('nvim-treesitter/nvim-treesitter')
   Plug('nvim-treesitter/nvim-treesitter-textobjects')
   Plug('neovim/nvim-lspconfig') -- Collection of configurations for built-in LSP client
   Plug('hrsh7th/nvim-cmp') -- Autocompletion plugin
   Plug('hrsh7th/cmp-nvim-lsp') -- source for neovim builtin LSP client
   Plug('hrsh7th/cmp-path') --completion source for paths
   Plug('hrsh7th/cmp-buffer') --completion source for buffer words
   Plug('saadparwaiz1/cmp_luasnip')
   Plug('L3MON4D3/LuaSnip') -- Snippets plugin
   Plug('lewis6991/gitsigns.nvim')
   Plug('tpope/vim-fugitive') -- Git commands in nvim
   Plug('dense-analysis/ale') -- asynchronous lint engine
   Plug('fisadev/vim-isort') --
   Plug('kyazdani42/nvim-web-devicons') -- dev icons with colors
   Plug('tpope/vim-rhubarb') -- Fugitive-companion to interact with github
   Plug('tpope/vim-commentary') -- "gc" to comment visual regions/lines
   Plug('ludovicchabant/vim-gutentags') -- Automatic tags management
   Plug('norcalli/nvim-colorizer.lua') -- colorizer
   Plug('rktjmp/lush.nvim') -- required by nvim-jellybeans
   Plug('kabouzeid/nvim-jellybeans') -- Color scheme
   Plug('nvim-lualine/lualine.nvim') -- status line in ua
   Plug('mengelbrecht/lightline-bufferline')
  --- Markdown supports
   Plug('godlygeek/tabular')
   Plug('plasticboy/vim-markdown') -- markdown formatter
   Plug('ellisonleao/glow.nvim') -- Preview within Neovim
   Plug('vimwiki/vimwiki') -- note taking tool
vim.call('plug#end')

-- Install plugins the first time vim runs
vim.cmd([[ if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif ]])

-- lualine
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'material',
--    component_separators = { left = '', right = ''},
--    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
tabline = {
  lualine_a = {'buffers'},
  lualine_b = {'branch'},
  lualine_c = {'filename'},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {'tabs'}
},
  extensions = {}
}

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}

-- Telescope
require('telescope').setup {
  defaults = {
    previewer = true,
	file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
	grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
	qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('utils').browse_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('utils').browse_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cs', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>km', [[<cmd>lua require('telescope.builtin').keymaps()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ng', [[<cmd>lua require('utils').grep_notes()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nf', [[<cmd>lua require('utils').find_notes()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nb', [[<cmd>lua require('utils').browse_notes()<CR>]], { noremap = true, silent = true })
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- LSP settings
-- nvim_lsp setup
local nvim_lsp = require 'lspconfig'
-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup ({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'ale' }
  },
})

vim.cmd([[
augroup NvimCmp
au!
au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]])

-- Enable the following language servers
local servers = { 'bashls', 'gopls', 'pylsp', 'tsserver', 'vimls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- ALE
vim.g.ale_linters = {
    go = {'gopls'},
    python = {'isort', 'yapf'},
    sh = {'shfmt'},
    typescript = {'deno', 'tslint'},
}

vim.g.ale_fixers = {
   ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
   ['python'] = {'isort','yapf'},
   ['sh'] = {'shfmt','remove_trailing_lines','trim_whitespace'},
   ['typescript'] = {'deno','tslint'},
}
vim.g.ale_fix_on_save = "1"

-- nvim colorizer
require'colorizer'.setup()

-- isort
  vim.g.vim_isort_python_version = 'python3'
  vim.g.vim_isort_map = '<C-i>'

-- Glow
-- preview markdown
vim.api.nvim_set_keymap('n', '<leader>p', ':Glow<CR>', { noremap = true, silent = true })

-- plasticboy/vim-markdown
  vim.cmd([[autocmd FileType markdown let b:sleuth_automatic=0]])
  vim.cmd([[autocmd Filetype markdown let g:conceallevel=2]])
  vim.cmd([[autocmd FileType markdown normal zR]])
  vim.g.vim_markdown_frontmatter = '1'
  vim.g.vim_markdown_emphasis_multiline = '1'
  vim.g.vim_markdown_folding_level = '2'

-- vimwiki
  -- global wiki settings
  vim.g.vimwiki_auto_header = 1
  vim.g.vimwiki_conceal_onechar_markers = 1
  vim.g.vimwiki_dir_link = 'index'
  vim.g.vimwiki_folding = 'expr'
  vim.g.vimwiki_use_calendar = 0

  wiki_prime = {
    auto_diary_index = 1,
    auto_generate_links = 1,
    auto_generate_tags = 1,
    auto_tags = 1,
    auto_toc = 1,
    automatic_nested_syntaxes = 1,
    diary_caption_level = 2,
    list_margin = 0,
    name = 'prime',
    nested_syntaxes = {
      python = "python",
      lua = "lua"
    },
    path = '~/Documents/Vimwiki/',
    syntax = 'markdown',
    ext = '.md'
  }
  vim.g.vimwiki_list = {wiki_prime}
