--vim.env.CC = "c:\\ProgramData\\chocolatey\\bin\\zig.exe cc"
--vim.env.CXX = "c:\\ProgramData\\chocolatey\\bin\\zig.exe c++"

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
     -- Backend
    "python", "c_sharp", "go", "rust", "json", "toml", "yaml", "sql", "dockerfile",
     -- Frontend
          "typescript", "tsx", "javascript", "html", "css", "scss",
     -- Systems / Retro
        "c", "cpp", "asm", "pascal", "lua",
     -- Blender / Graphics
      "glsl",
     -- General
    "bash", "regex", "markdown", "markdown_inline", "gitcommit", "diff", "ini",
        },
     -- ensure_installed = { "json5" },

    -- R compilers = { "zig" },
    highlight = { enable = true },
    indent = { enable = true },
    -- auto_install = true, -- install a missing parser when you open a file
    sync_install = true, -- sequential builds (Windows-friendly)
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        node_decremental = "<M-space>",
      },
    },
  },
  -- This runs *before* TS tries to compile anything
  -- xxxinit = function()
  --   --vim.env.CC = "c:\\ProgramData\\chocolatey\\bin\\zig.exe cc"
  --   --vim.env.CXX = "c:\\ProgramData\\chocolatey\\bin\\zig.exe c++"
  -- end,

  config = function(_, opts)
    -- R require("nvim-treesitter.install").compilers = { "zig" }
    -- R opts.compilers = { "zig" }
    opts.incremental_selection = opts.incremental_selection or {}
    opts.incremental_selection.enable = true
    opts.incremental_selection.keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      node_decremental = "<M-space>",
    }

-- Wait 2 seconds before requiring Tree-sitter configs
    vim.defer_fn(function()
      local ok, tsconfigs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        vim.notify(
          "[nvim-treesitter] failed to load configs module. Make sure the plugin is installed and parsers are built.",
          vim.log.levels.ERROR
        )
        return
      end

      tsconfigs.setup(opts)
    end, 5000)  -- 2000 ms = 2 seconds delay

    -- require("nvim-treesitter.configs").setup(opts)
    -- Force Zig compilers
  end,

  -- build = ":TSUpdate", -- still run normal update
}
