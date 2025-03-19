local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.loop) then
  print("Error: LuaJIT is not available. Lazy.nvim requires LuaJIT.")
  return
end
if not (vim.loop.fs_stat or vim.loop.fs_file)(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    import = "myvim.plugins",
    checker = {
        enabled = false,
    },
    change_detection = {
        notify = true
    },
    git = {
        timeout = 600
    },
    rocks = {
        enabled = true
    },
})
