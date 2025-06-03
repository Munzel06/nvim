-- ~/.config/nvim/lua/plugins/lazygit.lua
return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_scaling_factor = 0.9
      vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'}
      vim.g.lazygit_floating_window_use_plenary = 0
      vim.g.lazygit_use_neovim_remote = 1
      vim.g.lazygit_use_custom_config_file_path = 0
      vim.g.lazygit_config_file_path = ''
      -- vim.g.lazygit_config_file_path = {} -- if you prefer a table
      vim.g.lazygit_on_exit_callback = nil

      -- Keymap from your remap.lua
      vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true, desc = "Open LazyGit" })
    end
  }
}
