-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local M = {}


-- Toggle fullscreen in Neovide
vim.keymap.set("n", "<F11>", function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end)

-- restore default neovim `s`: substitute
vim.keymap.set("n", "s", "s", { remap = true, desc = "Substitute (restore Vim default)" })

-- Use ñ for Flash jumps
vim.keymap.set({ "n", "x", "o" }, "ñ", function()
  require("flash").jump()
end, { desc = "Single char jump" })

-- Use ' for '
vim.keymap.set("n", "'", "`", { noremap = true })

-- Alt-ñ to expand selection
-- vim.keymap.set({ "n", "v" }, "<C-ñ>", "<C-Space>", { noremap = true, silent = true })

-- Alt+Shift+ñ to shrink selection
-- vim.keymap.set("v", "<M-Ñ>", function()
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<M-space>", true, false, true), "n", true)
-- end, { desc = "Shrink selection (Alt-Shift-ñ)" })

local wk = require("which-key")

wk.add({
  lhs = "<leader>t", desc = "terminal and Run" , mode = "n"  -- <-- this changes "+3 keymaps" to "Terminal Shortcuts"
})

-- Windows 11 LazyVim terminal keymaps
local opts = { noremap = true, silent = true }
-- Optional: use PowerShell as default shell
vim.opt.shell = "cmd" -- "pwsh"  -- change to "cmd" if you prefer cmd.exe
-- Vertical split terminal
vim.keymap.set('n', '<leader>tv', function()
  vim.cmd('vsplit | terminal')
  vim.cmd('startinsert')
end, vim.tbl_extend("force", opts, { desc = "Terminal Vertical Split" }))
-- Horizontal split terminal
vim.keymap.set('n', '<leader>th', function()
  vim.cmd('split | terminal')
  vim.cmd('startinsert')
end, vim.tbl_extend("force", opts, { desc = "Terminal Horizontal Split" }))
-- Floating terminal (requires toggleterm.nvim)
vim.keymap.set('n', '<leader>tf', function()
  vim.cmd('ToggleTerm direction=float')
end, vim.tbl_extend("force", opts, { desc = "Floating Terminal" }))
-- Vertical terminal and run React dev server (npm start)
vim.keymap.set('n', '<leader>wt', function()
  vim.cmd('vsplit | terminal')
  vim.cmd('startinsert')
  -- Send "npm start" to terminal
  vim.api.nvim_chan_send(vim.b.terminal_job_id, "npm start\r")
end, vim.tbl_extend("force", opts, { desc = "React Dev Server Terminal" }))

-- run in terminal showrtcut

local function find_project_root()
  local path = vim.fn.getcwd()
  while path ~= "/" do
    if vim.fn.filereadable(path .. "/package.json") == 1 then
      return path
    end
    path = vim.fn.fnamemodify(path, ":h")
  end
  return nil
end

vim.keymap.set('n', '<leader>tr', function()
  local root = find_project_root()
  if root then
    vim.cmd('5split | terminal')
    vim.cmd('startinsert')
    -- cd to project root first
    vim.api.nvim_chan_send(vim.b.terminal_job_id, "cd " .. root .. " && npm start\r")
  else
    print("🚫 No React project found here")
  end
end, { noremap = true, silent = true, desc = "React Dev Server (auto project root)" })

vim.keymap.set('n', '<leader>tb', function()
  vim.cmd('5split | :RunBackend')
  vim.cmd('startinsert')
end, { noremap = true, silent = true, desc = "Run Backend"})

vim.keymap.set('n', '<leader>tB', function()
  vim.cmd('5split | :CompileBackend')
  vim.cmd('startinsert')
end, { noremap = true, silent = true, desc = "Compile Backend"})

-- Show main dashboard
local function showDashboard()
  local Snacks = require("snacks")
  Snacks.dashboard.open()
end
vim.keymap.set("n", "<leader>um", showDashboard, { desc = "Main dashboard/screen" })


-- in your keymaps.lua or inside the config function of LazyVim
vim.keymap.set("n", "<leader>cll", function()
  -- stop all LSP clients
  for _, client in pairs(vim.lsp.get_active_clients()) do
    vim.lsp.stop_client(client.id, true)
  end
  -- reload all open buffers
  vim.cmd("bufdo e")
  -- show a notification
  vim.notify("LSP restarted & buffers reloaded", vim.log.levels.INFO)
end, { desc = "Reload buffers and restart LSP" })


-- in your keymaps.lua or inside the config function of LazyVim
vim.keymap.set("n", "<leader>clL", function()
  -- stop all LSP clients
  for _, client in pairs(vim.lsp.get_active_clients()) do
    vim.lsp.stop_client(client.id, true)
  end
end, { desc = "Stop LSP" })

vim.keymap.set("n", "<leader>p#", function()
  require("utils.csproj").add_prev_buffer_to_csproj()
end, { desc = "Add previous buffer .cs file to .csproj" })

function M.setup_lsp_keymaps(bufnr)

    --require("lazy").load({ plugins = { "telescope" }})
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Common LSP keymaps

    vim.keymap.set("n", "<leader>cL", function() Snacks.picker.lsp_config() end,
                   vim.tbl_extend("force", opts, { desc = "LSP Info" }))

    vim.keymap.set("n", "<leader>cD", vim.lsp.buf.definition, -- cld
                   vim.tbl_extend("force", opts, { desc = "Definitions" }))
    vim.keymap.set("n", "<leader>cR", "<cmd>Trouble lsp_references<CR>", --clr
                   vim.tbl_extend("force", opts, { desc = "References (Trouble)" }))
    -- vim.keymap.set("n", "<leader>cT", "<cmd>Telescope lsp_references<CR>", --clR
    --                vim.tbl_extend("force", opts, { desc = "References (project-wide)" }))
    vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover,
                   vim.tbl_extend("force", opts, { desc = "Hover" }))
    vim.keymap.set("n", "<leader>cI", "<cmd>Trouble lsp_implementations<CR>", --cli
                   vim.tbl_extend("force", opts, { desc = "Implementations (Trouble)" }))
    vim.keymap.set("n", "<leader>cT", "<cmd>Trouble lsp_type_definitions<CR>", --clt
                   vim.tbl_extend("force", opts, { desc = "Type Definitions (Trouble)" }))
end

return M
