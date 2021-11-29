# nvim-configs

## Vim is not just a tool; it is an adventure!

#### Neovim (Lua):
Neovim configured in Lua.  I have set this one up for writing code and taking notes.  With Treesitter and Telescope, it is able to do fuzzy searches in Vimwiki notes as well as work with strings buried deep in a file system.

#### init.vim (Vimscript):
Neovim with a few plugins to make it great for writing code, notes, and text.

#### init-noplugins.vim (Vimscript):
A spartan yet effective Neovim configuration with no plugins.  Rename this to "init.vim" before use.

#### Usage:
 - Have Neovim version 5 or later installed on the system.
 - Use the desired init file for your Vimscript based configuration.
 - For a Lua based configuration, rename the "nvim-lua" directory to "nvim" and start Neovim.
   * Instead of init.vim there is init.lua and several small <filename>.lua files in subdirectories.
 - Vim-Plug manages the plugins. Execute **:PlugInstall** and **:PlugUpdate** to install and maintain them.
 - For max productivity and happy Vimming, learn the many keybindings.
