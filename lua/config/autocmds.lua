-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("BufDelete", {
  group = vim.api.nvim_create_augroup("bufdelpost_autocmd", {}),
  desc = "BufDeletePost User autocmd",
  callback = function()
    vim.schedule(function()
      vim.api.nvim_exec_autocmds("User", {
        pattern = "BufDeletePost",
      })
    end)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BufDeletePost",
  group = vim.api.nvim_create_augroup("dashboard_delete_buffers", {}),
  desc = "Open Dashboard when no available buffers",
  callback = function(ev)
    local deleted_name = vim.api.nvim_buf_get_name(ev.buf)
    local deleted_ft = vim.api.nvim_get_option_value("filetype", { buf = ev.buf })
    local deleted_bt = vim.api.nvim_get_option_value("buftype", { buf = ev.buf })
    local dashboard_on_empty = deleted_name == "" and deleted_ft == "" and deleted_bt == ""

    if dashboard_on_empty then
      Snacks.dashboard.open()
    end
  end,
})


-- Use vim.loop (libuv)
local uv = vim.loop

-- Get current working directory
local cwd = vim.fn.getcwd()

-- Search for a .sln file in cwd or parent directories
local function find_solution_old(start_dir)
  local dir = start_dir or cwd

  while dir do
    local handle = uv.fs_scandir(dir)
    if handle then
      while true do
        local name, _ = uv.fs_scandir_next(handle)
        if not name then break end
        if name:match("%.sln$") then
          return dir, name -- return folder and solution filename
        end
      end
    end
    -- Move one level up
    local parent = dir:match("(.+)/[^/]+$") or dir:match("(.+)\\[^\\]+$") -- handle / or \ paths
    if not parent or parent == dir then break end
    dir = parent
  end
  return nil, nil
end

-- local function find_solution(start_dir)
--   local cwd = start_dir or vim.fn.getcwd()
--   local sln_path = vim.fn.findfile("*.sln", cwd .. "/;")
--   if sln_path ~= "" then
--     local dir = vim.fn.fnamemodify(sln_path, ":h")
--     local name = vim.fn.fnamemodify(sln_path, ":t")
--     return dir, name
--   end
--   return nil, nil
-- end

-- Attempt to find solution
local sln_dir, sln_file = find_solution_old()

if sln_dir and sln_file then
  local config_file = sln_dir .. "/../local-only/applicationhost.config" -- adjust if needed
  local site_name = "HC.RestService"
  local app_pool = "Clr4IntegratedAppPool"

  vim.api.nvim_create_user_command('RunBackend', function()
    -- Build solution
    vim.fn.system(string.format('msbuild "%s/%s" /p:Configuration=Debug', sln_dir, sln_file))

    -- Run in a split terminal
    vim.cmd('term "C:/Program Files (x86)/IIS Express/iisexpress.exe" /config:' .. config_file .. ' /site:' .. site_name .. ' /apppool:' .. app_pool)
    vim.cmd('startinsert') -- Optional: enter insert mode in the terminal
  end, {})
end
