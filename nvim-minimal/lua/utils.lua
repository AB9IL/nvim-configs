-- status line
vim.cmd([[
au VimEnter * hi statusline guifg=#CCCCDD guibg=#262626 ctermfg=White ctermbg=Black
function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline guifg=#5080DD guibg=#262626 ctermfg=Cyan ctermbg=Black
    elseif a:mode == 'r'
        hi statusline  guifg=#DD4040 guibg=#262626 ctermfg=Red  ctermbg=Black
    else
        hi statusline guifg=#CCCCDD guibg=#262626 ctermfg=White ctermbg=Black
    endif
endfunction
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guifg=#CCCCDD guibg=#262626 ctermfg=White ctermbg=Black
]])

local mode_map = {
	['n'] = 'NORMAL ',
	['no'] = 'NORMAL·OPERATOR PENDING ',
	['v'] = 'VISUAL ',
	['V'] = 'V·LINE ',
	[''] = 'V·BLOCK ',
	['s'] = 'SELECT ',
	['S'] = 'S·LINE ',
	[''] = 'S·BLOCK ',
	['i'] = 'INSERT ',
	['R'] = 'REPLACE ',
	['Rv'] = 'V·REPLACE ',
	['c'] = 'COMMAND ',
	['cv'] = 'VIM EX ',
	['ce'] = 'EX ',
	['r'] = 'PROMPT ',
	['rm'] = 'MORE ',
	['r?'] = 'CONFIRM ',
	['!'] = 'SHELL ',
	['t'] = 'TERMINAL ',
}

function mode()
	local m = vim.api.nvim_get_mode().mode
	if mode_map[m] == nil then return m end
	return mode_map[m]
end

function status_line()
  local stl = {
  '%#PrimaryBlock#',
  mode(),
    '%3n ',
    '%#SecondaryBlock#',
    '%#Blanks#',
    '%f ',
    '%h%m%r%w ',
    '%=',
    '%{&fileformat} ',
    '| %{&fenc} ',
    '| %{&filetype} ',
    '%#SecondaryBlock#',
    ' %<%p%% ',
    '%-4.(%l:%c%)',
    '%#PrimaryBlock#',
  }
  return table.concat(stl)
end

vim.opt.statusline = "%{%v:lua.status_line()%}"
