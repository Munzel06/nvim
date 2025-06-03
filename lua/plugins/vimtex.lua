-- ~/.config/nvim/lua/plugins/vimtex.lua
return {
  {
    'lervag/vimtex',
    lazy = false, -- Or ft = "tex" if you only want it to load for TeX files
    config = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_auto_start = 1 -- Set to 1 to enable, 0 to disable
      -- Ensure this is 1 if you want it to start automatically on compilation success.
      -- It was commented as such in your after/plugin/vimtex.lua implies it was intended to be 1
    end
  }
}
