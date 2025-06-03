-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false, -- Load this early
    priority = 1000, -- Ensure it loads before other plugins that might set highlights
    config = function()
      -- You can set options for rose-pine here if needed, e.g.:
      -- require('rose-pine').setup({
      --   disable_background = true,
      -- })
      vim.cmd('colorscheme rose-pine')

      -- The ColorMyPencils function can be defined and called here as well
      -- function ColorMyPencils(color)
      --  color = color or "rose-pine"
      --  vim.cmd.colorscheme(color)
      -- end
      -- ColorMyPencils()
    end
  }
}
