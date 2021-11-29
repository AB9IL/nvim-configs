""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
filetype plugin indent on
let fancy_symbols_enabled = 0
let mapleader="\<Space>"
set autoindent
set clipboard+=unnamedplus
set colorcolumn=80
set complete+=kspell
set completeopt=menuone,noinsert,noselect
set conceallevel=2
set cursorline
set encoding=utf-8
set expandtab
set hidden
set history=500
set hlsearch
set incsearch
set nowrap
set nobackup
set noshowmode
set noswapfile
set mouse=a
set pastetoggle=<f2>
set path+=.,**
set ruler
set shell=/bin/bash
set tabstop=4
set textwidth=0
set softtabstop=4
set title
set number
set fillchars+=vert:\
set scrolloff=8
set shiftwidth=4
set shiftround
set shortmess+=c
set showtabline=2
set signcolumn=yes
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set undodir=~/.config/nvim/undodir
set undofile
set updatetime=500
set wildmode=list:longest


" Set colors and transparency
colorscheme jellybeans
set termguicolors
hi clear LineNr
hi clear SignColumn

" Clean up trailing whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Set filetype syntax and behavior 
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mdwn,*md set ft=markdown
au BufNewFile,BufRead conf,config,*.conf,*.strm,*.xspf set ft=config

" Writer mode
fun! Writer()
	setlocal spell spelllang=en_us
	setlocal formatoptions=t1
	setlocal textwidth=80
	setlocal noautoindent
	setlocal shiftwidth=5
	setlocal tabstop=5
	setlocal expandtab
endfun
com! WR call Writer()

" Prevent rezize glitch on open
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Navigate tabs
map tt :tabnew<CR>
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through buffers.
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Clear search highlights.
map <Leader><Space> :let @/=''<CR>
nnoremap <silent> // :noh<CR>

" Format paragraph (selected or not) to 80 character lines.
nnoremap <Leader>g gqap
xnoremap <Leader>g gqa

" Better indentation.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>

" Allow gf to ceate and open files
map gf :edit <cfile><CR>

" Open the current file in the default program
nmap <Leader>x :!xdg-open %<CR><CR>

" Toggle spell check.
map <F5> :setlocal spell!<CR>

" Toggle relative line numbers and regular line numbers.
nmap <F6> :set invrelativenumber<CR>

" Automatically fix the last misspelled word and jump back to where you were.
"   Taken from this talk: https://www.youtube.com/watch?v=lwD8G1P52Sk
nnoremap <leader>sp :normal! mz[s1z=`z<CR>

" Toggle visually showing all whitespace characters.
noremap <F7> :set list!<CR>
inoremap <F7> <C-o>:set list!<CR>
cnoremap <F7> <C-c>:set list!<CR>

" Save with Ctrl-s
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" Select All
nnoremap <C-a> ggVG
inoremap <C-a> <ESC>ggVG

" Save as sudo
ca w!! w !sudo tee "%"

" Open a terminal
nnoremap <C-w>t :terminal<CR>

" Easy quit
nnoremap q :q!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
  let g:netrw_banner = 0
  let g:netrw_liststyle = 3
  let g:netrw_browse_split = 4
  let g:netrw_altv = 1
  let g:netrw_winsize = 20
  let g:NetrwIsOpen=0

  function! OpenToRight()
    :normal v
    let g:path=expand('%:p')
    execute 'q!'
    execute 'belowright vnew' g:path
    :normal <C-w>l
  endfunction

  function! OpenBelow()
    :normal v
    let g:path=expand('%:p')
    execute 'q!'
    execute 'belowright new' g:path
    :normal <C-w>l
  endfunction

  function! OpenTab()
    :normal v
    let g:path=expand('%:p')
    execute 'q!'
    execute 'tabedit' g:path
    :normal <C-w>l
  endfunction

  function! NetrwMappings()
      " Hack fix to make ctrl-l work properly
      noremap <buffer> <A-l> <C-w>l
      noremap <buffer> <C-l> <C-w>l
      noremap <silent> <A-f> :call ToggleNetrw()<CR>
      noremap <buffer> V :call OpenToRight()<cr>
      noremap <buffer> H :call OpenBelow()<cr>
      noremap <buffer> T :call OpenTab()<cr>
  endfunction

  augroup netrw_mappings
      autocmd!
      autocmd filetype netrw call NetrwMappings()
  augroup END

  " Allow for netrw to be toggled
  function! ToggleNetrw()
      if g:NetrwIsOpen
          let i = bufnr("$")
          while (i >= 1)
              if (getbufvar(i, "&filetype") == "netrw")
                  silent exe "bwipeout " . i
              endif
              let i-=1
          endwhile
          let g:NetrwIsOpen=0
      else
          let g:NetrwIsOpen=1
          silent Lexplore
      endif
  endfunction

" Manually toggle Netrw
nmap <leader>n :Lexplore<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status bar colors
au InsertEnter * hi statusline guifg=black guibg=white ctermfg=black ctermbg=white
au InsertLeave * hi statusline guifg=black guibg=white ctermfg=black ctermbg=white
hi statusline guifg=black guibg=white ctermfg=black ctermbg=white

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%3n\                                " buffer number
set statusline+=%h%m%r%w\                           " flags
set statusline+=%f\                                 " file name
set statusline+=%=                                  " right align
set statusline+=%{&fileformat}\ \|                  " file format
set statusline+=\ %{strlen(&fenc)?&fenc:&enc}\ \|   " encoding
set statusline+=\ %{strlen(&ft)?&ft:'none'}\        " filetype
set statusline+=\ %<%p%%\                             " position
set statusline+=\ %-4.(%l:%c%)\                     " offset

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
