return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			go = { "gofmt" },
			python = { "ruff_format", "ruff_organize_imports", stop_after_first = true },
			lua = { "stylua" },
			sh = { "shfmt", "shellcheck" },
			css = { "prettierd" },
			html = { "tidy" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			markdown = { "prettierd" },
			perl = { "prettierd" },
			toml = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			vue = { "prettierd" },
			yaml = { "prettierd" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 700 },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
			prettierd = {
				prepend_args = {
					"--print-width=160",
					"--single-attribute-per-line=false",
					"--html-whitespace-sensitivity=ignore",
					"--config-precedence=prefer-file",
				},
			},
		},
		tidy = {
			command = "tidy",
			args = {
				"--indent",
				"no",
				"--quiet",
				"yes",
				"--show-warnings",
				"no",
				"--show-info",
				"no",
				"--output-html",
				"yes",
				"--wrap",
				"0",
			},
			stdin = false, -- tidy reads from file
			cwd = vim.fn.expand("%:p:h"), -- run in file's directory
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
