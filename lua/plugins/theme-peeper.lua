return {
  {
    "JohnnyJumper/theme-peeper.nvim",
    lazy = false,
    dependencies = {
      {
        "folke/snacks.nvim",
        opts = {
          picker = {},
        },
      },
    },
    keys = {
      {
        "<leader>uk",
        function()
          require("theme_peeper").select()
        end,
        desc = "Theme Peeper",
      },
    },
    opts = {
      picker = "snacks", -- "snacks",
      previewer = "float",
      persist = true,

      preview = {
        profile = "code", -- minimal -- ui -- "diagnostics", -- "code",
        max_height = 30,
      },

      pickers = {
        snacks = {
          width = 70,
          max_height = 30,
          preview_width = 110,
          preview_max_height = 30,
        },
      },
    },
  },
}
