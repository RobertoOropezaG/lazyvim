return {
  "LazyVim/LazyVim",
  opts = {
    -- colorscheme = "tokyonight",
    -- "nightfly" -- "blue" -- "habamax" -- "blue" -- "wildcharm" -- "murphy" -- "vim" -- "habamax",
  },
  { "bluz71/vim-moonfly-colors" },
  { "bluz71/vim-nightfly-colors" },
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  -- { "caglartoklu/borlandp.vim" },
  -- { "vim-scripts/borland.vim" },
  { "loctvl842/monokai-pro.nvim" },
  { "letorbi/vim-colors-modern-borland",
    init = function()
    --    vim.g.BorlandStyle = "classic"
    --    vim.g.BorlandParen = 1
    end,
  },
  { "sainnhe/everforest" },
  { "jpwol/thorn.nvim", lazy = false, priority = 1000, opts = {}},
  { "olimorris/onedarkpro.nvim" },
  { "marko-cerovac/material.nvim" },
  { "shaunsingh/nord.nvim" },
  { "sainnhe/edge"},
  { "kungfusheep/mfd.nvim"}, -- monochromatic crt
  -- { "cmoscofian/nibble-vim" },
  --{ "Evalir/dosbox-vim-colorscheme" },

  { "savq/melange-nvim" },
  {
    "nyoom-engineering/oxocarbon.nvim",
    build = false,
    -- Add in any other configuration; 
    --   event = foo, 
    --   config = bar
    --   end,
  },
  {
      "zenbones-theme/zenbones.nvim",
      -- Optionally install Lush. Allows for more configuration or extending the colorscheme
      -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
      -- In Vim, compat mode is turned on as Lush only works in Neovim.
      dependencies = "rktjmp/lush.nvim",
      lazy = false,
      priority = 1001,
      -- you can set set configuration options here
      -- config = function()
      --     vim.g.zenbones_darken_comments = 45
      --     vim.cmd.colorscheme('zenbones')
      -- end
  },
  { 'Mofiqul/vscode.nvim' },
  {
    "Aejkatappaja/sora",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("sora").setup(opts)
      vim.cmd("colorscheme sora")
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
}
