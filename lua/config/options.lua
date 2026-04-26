-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guifont = "0xProto Nerd Font Mono:h14"
-- vim.o.guifont = "PxPlus IBM VGA8:h16"
-- vim.opt.guifont = "Perfect DOS VGA 437 Win"
vim.g.autoformat = false
-- vim.opt.listchars:append({ trail = "·" })
vim.opt.listchars:append({ trail = "･" })
vim.g.indent_blankline_enabled = false
vim.opt.title = true
vim.opt.titlestring = "nv - " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":h:t") .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

-- vim.opt.colorcolumn = "120"
vim.opt.cursorline = false
vim.opt.guicursor:append("a:blinkon500-blinkoff500")
--Allow .nvim.lua and .exrc files in the current directory to be loaded
vim.o.exrc = true
vim.o.secure = true

vim.o.background = "dark"

local gui_configs = {
  neovide = function()
    vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":h:t") .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " - neovide"
    vim.g.neovide_scale_factor = 0.75
    -- vim.opt.guifont = "0xProto Nerd Font Mono:h11"
    vim.g.neovide_cursor_animation_length = 0.07
    vim.g.neovide_cursor_trail_length = 0.3
    -- otros: "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe"   -- vim.g.neovide_cursor_vfx_mode = {"torpedo", "wireframe"}
    -- vim.g.neovide_cursor_vfx_mode = {"torpedo", "wireframe"}
    vim.g.neovide_cursor_vfx_opacity = 100.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_density = 15.0
    vim.g.neovide_cursor_vfx_particle_speed = 10.0
    vim.g.neovide_cursor_vfx_particle_phase = 1.5
    vim.g.neovide_cursor_vfx_particle_curl = 1.0
    --
    --
    -- -- Retro CRT Neovide preset
    -- vim.g.neovide_text_gamma = 0.0
    -- vim.g.neovide_text_contrast = 0.0
    -- vim.g.neovide_scale_factor = 1.0
    --
    -- vim.g.neovide_cursor_animation_length = 0
    -- vim.g.neovide_scroll_animation_length = 0
    -- vim.g.neovide_position_animation_length = 0
    --
    -- -- vim.opt.linespace = -2
    --
    -- vim.opt.guicursor = {
    --   -- "n-v-c:block",
    --   -- "i:block",
    --   -- "r:block",
    --   -- "o:block",
    --   "a:blinkon500-blinkoff500",
    -- }
    --
    -- vim.api.nvim_set_hl(0, "Normal", {
    --   fg = "#33ff33",
    --   bg = "#000000",
    -- })
  end,

  -- Example placeholder for another GUI (like FVim or Goneovim)
  fvim = function()
    -- fvim-specific options go here
  end,

  goneovim = function()
    -- goneovim-specific options go here
  end,
}

-- Apply GUI config on every UI attach
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    for gui_name, config_func in pairs(gui_configs) do
      if vim.g[gui_name] then
        config_func()
      end
    end
  end,
})

local project_config = vim.fn.findfile('.nvim.lua', '.;')
if project_config ~= '' then
  vim.cmd('source ' .. project_config)
end
