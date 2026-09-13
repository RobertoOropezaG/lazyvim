return {
  {
    "xiyaowong/transparent.nvim",
    opts = {
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "NvimTreeNormalNC",
      },
    },
    keys = {
      {
        "<leader>ut",
        "<cmd>TransparentToggle<cr>",
        desc = "Toggle Transparent Background",
      },
    },
  },
}
