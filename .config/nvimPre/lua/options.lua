require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.colorcolumn = "90"
o.relativenumber = true

--Neovide options:->
if vim.g.neovide then
  -- Set the default scale factor
  vim.g.neovide_scale_factor = 1.0

  vim.g.neovide_padding_top = 14

  vim.keymap.set("i", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })

  vim.g.neovide_refresh_rate = 60

  vim.g.neovide_cursor_animation_length = 0.04

  vim.g.neovide_cursor_trail_size = 0.7

  vim.g.neovide_hide_mouse_when_typing = true

  -- produce particles behind the cursor, if want to disable them, set it to ""
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  -- vim.g.neovide_cursor_vfx_mode = "torpedo"
  -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
  -- vim.g.neovide_cursor_vfx_mode = "ripple"
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"

  vim.g.neovide_scroll_animation_length = 0.1
end
