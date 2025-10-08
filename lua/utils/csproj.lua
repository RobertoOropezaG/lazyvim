
local M = {}

-- Add the PREVIOUS buffer file to a .csproj file
function M.add_prev_buffer_to_csproj()
  -- Get previous buffer name
  local prev_bufnr = vim.fn.bufnr("#")
  if prev_bufnr == -1 then
    vim.notify("No previous buffer found", vim.log.levels.WARN)
    return
  end

  local file = vim.api.nvim_buf_get_name(prev_bufnr)
  if file == "" then
    vim.notify("Previous buffer has no name", vim.log.levels.WARN)
    return
  end

  -- Make path relative to project root
  local rel_file = vim.fn.fnamemodify(file, ":.")
  -- Remove the first folder (parent) from the path
  local parts = vim.split(rel_file, "[/\\]")
  if #parts > 1 then
    table.remove(parts, 1)
  end
  rel_file = table.concat(parts, "\\")

  if not rel_file:match("%.cs$") then
    vim.notify("Previous buffer is not a .cs file: " .. rel_file, vim.log.levels.WARN)
    return
  end

  -- Current buffer must be a .csproj
  local cur_file = vim.api.nvim_buf_get_name(0)
  if not cur_file:match("%.csproj$") then
    vim.notify("Current buffer is not a .csproj file", vim.log.levels.ERROR)
    return
  end

  -- Insert line before </Project> or before </ItemGroup> if available
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local insert_idx = #lines
  for i, line in ipairs(lines) do
    if line:match("</ItemGroup>") then
      insert_idx = i - 1
      break
    elseif line:match("</Project>") then
      insert_idx = i - 1
      break
    end
  end

  local new_line = string.format('    <Compile Include="%s" />', rel_file:gsub("\\", "/"))
  vim.api.nvim_buf_set_lines(0, insert_idx, insert_idx, false, { new_line })
  vim.notify("Added " .. rel_file .. " to " .. cur_file, vim.log.levels.INFO)
end

return M
