# nvim-configs

## Neovim is not just a tool; it is an adventure!

#### Directory "nvim":
Neovim configured in Lua.  I have set this one up for writing code and taking notes.  With Treesitter and Telescope, it is able to do fuzzy searches in Vimwiki notes as well as work with strings buried deep in a file system.

#### Directory "nvim-minimal":
A spartan yet effective Neovim configuration in Lua, with no plugins.  I use this one for editing as root user, renamed to /etc/xdg/nvim/ on my Linux devices.

#### Usage:
 - Have Neovim version 5 or later installed on the system.
 - Select the minimal or regular setup depending on your text editing needs.
 - Packer manages the plugins. Execute **:PackerUpdate** and **:PackerCompile** to install them the first time.
 - Execute **:PackerSync** for future updates.
 - Treesitter is part of the setup. Execute **:TSInstall** on first run, **:TSUpdate** for subsequent updates.
 - For max productivity and happy Vimming, learn the many keybindings and change as needed.
 - Make it work for you.
