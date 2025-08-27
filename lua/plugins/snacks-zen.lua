-- lua/config/snacks-zen.lua
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.styles = opts.styles or {}
    opts.styles.zen = opts.styles.zen or {}
    opts.styles.zen.width = 130 --                                         80 |                                    120 |     130 |
    -- everything else (options, plugins, etc.) remains default
  end,
}
