-- ~/.config/nvim/lua/config/colorscheme.lua

function ColorMyPencils(color)
  color = color or "rose-pine"
  local status, _ = pcall(vim.cmd.colorscheme, color)
  if not status then
    vim.notify("Colorscheme " .. color .. " not found!", vim.log.levels.WARN)
    return
  end
end

ColorMyPencils() -- Call it here to set the theme on startup
                 -- Alternatively, for Lazy.nvim, it's common to set it in the plugin's config.
