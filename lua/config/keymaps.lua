-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local options = require("config.options")

-- Toggle highlight of the current line
-- Cursor line
Snacks.toggle.option("cursorline", {
  name = "Cursor Line",
}):map("<leader>uH")

local neovide_fonts = options.neovide_fonts
local initial_guifont = vim.opt.guifont:get()[1]

local function get_font_name(guifont)
  return guifont:gsub(":h[%d%.]+.*$", "")
end

-- cycle font sizes
-- ---------------------
local function get_font_size(guifont)
  return tonumber(guifont:match(":h([%d%.]+)"))
end

local function change_font_size(delta)
  local guifont = vim.opt.guifont:get()[1]
  if not guifont then
    return
  end

  local old_size = get_font_size(guifont)
  if not old_size then
    return
  end

  local new_size = math.max(6, old_size + delta)

  vim.opt.guifont = guifont:gsub(":h[%d%.]+", ":h" .. new_size)

  vim.notify(
    string.format(
      "%s: %.1f → %.1f",
      get_font_name(guifont),
      old_size,
      new_size
    ),
    vim.log.levels.INFO,
    { title = "Neovide Font Size" }
  )
end

vim.keymap.set("n", "<leader>uj", function()
  change_font_size(-0.5)
end, { desc = "Decrease font size" })

vim.keymap.set("n", "<leader>uJ", function()
  change_font_size(0.5)
end, { desc = "Increase font size" })

vim.keymap.set("n", "<leader>u0", function()
  local current_guifont = vim.opt.guifont:get()[1]
  local current_size = get_font_size(current_guifont)
  local initial_size = get_font_size(initial_guifont)

  vim.opt.guifont = initial_guifont

  vim.notify(
    string.format(
      "%s: %.1f → %.1f",
      get_font_name(initial_guifont),
      current_size,
      initial_size
    ),
    vim.log.levels.INFO,
    { title = "Neovide Font Reset" }
  )
end, { desc = "Reset font size" })

-- Cycle fonts
-- -------------------------
local function get_current_font_index()
  local current_name = get_font_name(vim.opt.guifont:get()[1])

  for index, font in ipairs(neovide_fonts) do
    if font.name == current_name then
      return index
    end
  end

  return 1
end

local function set_font(index)
  local font = neovide_fonts[index]

  vim.opt.guifont = string.format(
    "%s:h%s:%s",
    font.name,
    font.size,
    font.width
  )

  vim.notify(
    string.format("%s: %.1f", font.name, font.size),
    vim.log.levels.INFO,
    { title = "Neovide Font" }
  )
end

vim.keymap.set("n", "<leader>uE", function()
  local current_index = get_current_font_index()
  local next_index = current_index % #neovide_fonts + 1
  set_font(next_index)
end, { desc = "Next font" })

vim.keymap.set("n", "<leader>ue", function()
  local current_index = get_current_font_index()
  local previous_index = (current_index - 2) % #neovide_fonts + 1
  set_font(previous_index)
end, { desc = "Previous font" })

vim.keymap.set("n", "<leader>u1", function()
  vim.opt.guifont = initial_guifont

  vim.notify(
    string.format(
      "%s: %.1f",
      get_font_name(initial_guifont),
      get_font_size(initial_guifont)
    ),
    vim.log.levels.INFO,
    { title = "Neovide Font Reset" }
  )
end, { desc = "Reset font" })
