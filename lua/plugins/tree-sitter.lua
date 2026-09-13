return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "bash",
      "json",
      "yaml",
      "toml",
      "markdown",
      "markdown_inline",
      "gitcommit",
      "diff",
    },

    highlight = {
      enable = true,
    },

    indent = {
      enable = true,
    },
  },
}
