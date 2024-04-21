-- Leader Key
vim.g.mapleader = " "
vim.keymap.set('i', 'jk', '<ESC>', {})
vim.keymap.set('i', 'kj', '<ESC>', {})

-- Lazy Loader
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Loading
require("lazy").setup("plugins")
require("options")
