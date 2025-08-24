-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guifont = "0xProto Nerd Font Mono:h14"

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_cursor_animation_length = 0.07 -- 0.15
  vim.g.neovide_cursor_trail_length = 0.3 -- undefined

  vim.g.neovide_cursor_vfx_mode = "railgun" -- []   -- otros: "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe"
  vim.g.neovide_cursor_vfx_opacity = 200.0 -- 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2 -- 0.5
  vim.g.neovide_cursor_vfx_particle_density = 15.0 -- 0.7
  vim.g.neovide_cursor_vfx_particle_speed = 10.0 -- 10.0
  vim.g.neovide_cursor_vfx_particle_phase = 1.5 -- 1.5
  vim.g.neovide_cursor_vfx_particle_curl = 1.0 -- 1.0
end
