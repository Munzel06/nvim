-- ~/.config/nvim/lua/plugins/undotree.lua
return {
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
    end
  }
}
