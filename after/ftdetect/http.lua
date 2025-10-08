-- Treat .http files as yaml
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.http",
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})

