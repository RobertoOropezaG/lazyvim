-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local options = require("config.options")


-- Exit terminal mode
vim.keymap.set("t", "<C-Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Open terminal
vim.keymap.set("n", "<leader>fw", function()
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal" })

vim.keymap.set("n", "<leader>fW", function()
  vim.cmd("vsplit")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal (vertical split)" })


-- Toggle highlight of the current line
-- Cursor line
Snacks.toggle.option("cursorline", {
  name = "Cursor Line",
}):map("<leader>uH")

--- Glance
vim.keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')
vim.keymap.set("n", "gm", "<Nop>", { desc = "Glance" })
vim.keymap.set('n', 'gmI', '<CMD>Glance implementations<CR>')
vim.keymap.set('n', 'gmd', '<CMD>Glance definitions<CR>')
vim.keymap.set('n', 'gmr', '<CMD>Glance references<CR>')
vim.keymap.set('n', 'gmt', '<CMD>Glance type_definitions<CR>')
vim.keymap.set('n', 'gms', '<CMD>Glance resume<CR>', { desc = 'Glance resume session' })

--- Yank file name and path
vim.keymap.set("n", "<leader>by", "<Nop>", {
  desc = "Yank file path or name"
})

vim.keymap.set("n", "<leader>byf", function()
  vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { desc = "Yank filename" })

vim.keymap.set("n", "<leader>byr", function()
  local cwd = vim.fn.getcwd()
  local file = vim.fn.expand("%:p")
  vim.fn.setreg("+", vim.fs.relpath(cwd, file))
end, { desc = "Yank relative path" })

vim.keymap.set("n", "<leader>byp", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Yank absolute path" })

vim.keymap.set("n", "<leader>byl", function()
  local cwd = vim.fn.getcwd()
  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  vim.fn.setreg("+", vim.fs.relpath(cwd, file) .. ":" .. line)
end, { desc = "Yank relative path + line" })

vim.keymap.set("n", "<leader>byn", function()
  vim.fn.setreg("+", vim.fn.expand("%:t:r"))
end, { desc = "Yank name without extension" })


-- FONTS AND TEXT SIZES
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
