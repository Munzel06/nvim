-- ~/.config/nvim/init.lua

-- Set <space> as the leader key
-- Must be set before plugins are loaded (especially if keymaps in plugins use it)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- or main for latest features
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy.nvim with plugin specifications from lua/plugins
require("lazy").setup("plugins", {
  checker = {
    enabled = true,
    notify = true,
  },
  change_detection = {
    notify = true,
  },
})

-- Load basic configurations
require("config.options")
require("config.keymaps")

-- Load plugin-specific configurations that are not part of their direct setup
-- (Often, plugin configurations are self-contained in their plugin spec file in lua/plugins)
-- e.g., if you had after/plugin/lsp.lua that wasn't just LSP plugin setup,
-- you might require('custom.lsp_settings') here after LSP plugins are loaded.
-- For your current setup, most after/plugin files will be integrated into plugin specs.

-- Load colorscheme after plugins (especially the colorscheme plugin) are loaded
-- This can also be handled by setting priority in the colorscheme plugin spec
require("config.colorscheme")
