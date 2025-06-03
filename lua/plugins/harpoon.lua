-- ~/.config/nvim/lua/plugins/harpoon.lua
return {
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Implicitly needed by some Harpoon features
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon quick menu" })

      vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Harpoon nav file 1" })
      vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = "Harpoon nav file 2" })
      vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "Harpoon nav file 3" })
      vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Harpoon nav file 4" })
    end
  }
}
