-- file: lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(vim.tbl_deep_extend("force", opts, {
        defaults = {
          -- layout settings from your config
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
            preview_width = 0.6,
          },
          sorting_strategy = "ascending",
          path_display = { "relative" },

          -- make all paths relative to current working directory
          -- path_display = function(_, path)
          --   local cwd = vim.fn.getcwd()
          --   return path:gsub("^" .. cwd .. "/", "")
          -- end,
        },
        pickers = {
          lsp_references = {
            path_display = { "shorten" }, -- THIS applies to LSP references
          },
          lsp_definitions = {
            path_display = { "shorten" }, -- optional for definitions too
          },
          lsp_implementations = {
            path_display = { "shorten" }, -- optional
          },
        },
      }))
    end,
  },
}
