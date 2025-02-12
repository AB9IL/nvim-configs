--netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"comment",
		"css",
		"csv",
		"html",
		"javascript",
		"lua",
		"markdown",
		"markdown_inline",
		"perl",
		"php",
		"python",
		"regex",
		"ruby",
		"typescript",
		"xml",
		"yaml",
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of languages to disable
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
		disable = { "html" },
	},
})

-- LSP settings
-- lsp diagnostics (signs)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- lsp diagnostics (messages)
local function setup_lsp_diags()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		underline = true,
	})
end
-- conform.nvim specify formatters
local conform = require("conform")

local function setFormat(filetypes, formatter)
	local config = {}
	for _, filetype in ipairs(filetypes) do
		config[filetype] = { formatter }
	end
	return config
end

local config = {
	go = { "gofmt" },
	python = { "ruff_format", "black", stop_after_first = true },
	lua = { "stylua" },
	shell = { "shfmt", "shellcheck" },
}

config = vim.tbl_extend(
	"keep",
	config,
	setFormat({
		"css",
		"javascript",
		"javascriptreact",
		"html",
		"json",
		"markdown",
		"perl",
		"toml",
		"typescript",
		"typescriptreact",
		"yaml",
	}, "prettier")
)
conform.setup({
	formatters_by_ft = config,
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
})
-- conform.nvim format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ async = true, lsp_fallback = true, bufnr = args.buf })
	end,
})

-- mini.nvim
require("mini.ai").setup({})
require("mini.bracketed").setup({})
require("mini.comment").setup({})
require("mini.completion").setup({})
require("mini.diff").setup({})
require("mini.extra").setup({})
require("mini.files").setup({
	mappings = {
		show_help = "gh",
		close = "<esc>",
	},
})
require("mini.fuzzy").setup({})
require("mini.git").setup({})
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
require("mini.icons").setup({})
require("mini.notify").setup({})
require("mini.operators").setup({})
require("mini.pairs").setup({})
require("mini.pick").setup({})
require("mini.statusline").setup({})
require("mini.surround").setup({})
require("mini.tabline").setup({})

-- mini.files
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "File explorer" })

-- mini.pick
vim.keymap.set("n", "<leader><space>", "<cmd>Pick buffers<cr>", { desc = "Search open files" })
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>", { desc = "Search all files" })
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<cr>", { desc = "Search help tags" })

-- nvim-lint
require("lint").linters_by_ft = {
	go = { "golangcilint" },
	html = { "tidy" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	json = { "jsonlint" },
	lua = { "luacheck" },
	markdown = { "markdownlint" },
	python = { "ruff" },
	ruby = { "ruby" },
	sh = { "shellcheck" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	xml = { "tidy" },
	yaml = { "yamllint" },
}

-- nvim-lint activate linting
vim.api.nvim_create_autocmd({ "InsertLeave", "BufNewFile", "BufRead" }, {
	callback = function()
		local lint_status, lint = pcall(require, "lint")
		if lint_status then
			lint.try_lint()
		end
	end,
})
-- Render-Markdown
require("render-markdown").setup({
	heading = {
		width = "block",
		left_pad = 2,
		right_pad = 4,
	},
	latex = {
		enabled = false,
	},
})
-- Mkdnflow
require("mkdnflow").setup()
vim.g.rocks = "luautf8"
