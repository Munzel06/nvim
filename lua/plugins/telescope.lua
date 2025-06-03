-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8', -- Or your desired tag/branch
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, { desc = 'Telescope grep string' })
      -- Add other Telescope configurations or pickers here if needed
    end
  }
}
