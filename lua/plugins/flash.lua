return {}

--[[
{
  "folke/flash.nvim",
  opts = function(_, opts)
    opts.modes = opts.modes or {}
    opts.modes.search = {
      -- don't restrict matches near the cursor
      incremental = false,
      -- only one character input
      max_length = 1,
      -- show all matches across the visible buffer
      highlight = { backdrop = true },
      jump = {
        autojump = false, -- wait for label press, don't jump immediately
      },
    }
    -- opts.modes.search = opts.modes.search or {}
    -- opts.modes.search.incremental = false
    -- opts.modes.search.enabled = true
    -- opts.modes.search.max_length = 1
    -- opts.modes.search.highlight = opts.modes.search.highlight or {}
    -- opts.modes.search.highlight.backdrop = true
    -- opts.modes.search.jump = opts.modes.search.jump or {}
    -- opts.modes.search.jump.autojump = false
  end,
}
]]
