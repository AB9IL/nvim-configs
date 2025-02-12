-- Create/get autocommand group
local augroup = vim.api.nvim_create_augroup
-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd
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
-- Prevent resize glitch on open
autocmd("VimEnter", {
	pattern = "*",
	command = ":silent !kill -s SIGWINCH $PPID",
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
	{ pattern = { "conf", "config", "*.conf", "*rc", "*.rc", "*.strm", "*.xspf" }, command = "set ft=config" }
)
-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({
			higroup = (vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"),
			timeout = "100",
		})
	end,
})
