return {
  -- Disable omnisharp from the dotnet extra; we use roslyn instead
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = { enabled = false },
        roslyn_ls = { enabled = false },
      },
    },
  },
  { "Hoffs/omnisharp-extended-lsp.nvim", enabled = false },

  -- Roslyn LSP — proper .NET 10 support
  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = {
      filewatching = "auto",
      broad_search = false,
    },
  },

  -- NOTE: roslyn-language-server is installed as a dotnet global tool, not via Mason
  -- Run once in a terminal: dotnet tool install --global roslyn-language-server
}
