--vim.env.CC = "c:\\ProgramData\\chocolatey\\bin\\zig.exe cc"
--vim.env.CXX = "c:\\ProgramData\\chocolatey\\bin\\zig.exe c++"

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- Backend
      "python",
      "c_sharp",
      "go",
      "rust",
      "json",
      "toml",
      "yaml",
      "sql",
      "dockerfile",

      -- Frontend
      "typescript",
      "tsx",
      "javascript",
      "html",
      "css",
      "scss",

      -- Systems / Retro
      "c",
      "cpp",
      "asm",
      "pascal",
      "lua",

      -- Blender / Graphics
      "glsl",

      -- General
      "bash",
      "regex",
      "markdown",
      "markdown_inline",
      "gitcommit",
      "diff",
      "ini",
      "http",
    },

    compilers = { "zig" },
    highlight = { enable = true },
    indent = { enable = true },
    -- auto_install = true, -- install a missing parser when you open a file
    sync_install = true, -- sequential builds (Windows-friendly)
  },
  -- This runs *before* TS tries to compile anything
  -- xxxinit = function()
  --   --vim.env.CC = "c:\\ProgramData\\chocolatey\\bin\\zig.exe cc"
  --   --vim.env.CXX = "c:\\ProgramData\\chocolatey\\bin\\zig.exe c++"
  -- end,

  config = function(_, opts)
    -- require("nvim-treesitter.configs").setup(opts)

    -- Force Zig compilers
    require("nvim-treesitter.install").compilers = { "zig" }
  end,

  -- build = ":TSUpdate", -- still run normal update
}
