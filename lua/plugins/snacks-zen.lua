-- lua/config/snacks-zen.lua
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.styles = opts.styles or {}
    opts.styles.zen = opts.styles.zen or {}
    opts.styles.zen.width = 130 --                                         80 |                                    120 |     130 |
    -- everything else (options, plugins, etc.) remains default
    -- Merge with existing explorer options
    opts.explorer = vim.tbl_deep_extend("force", opts.explorer or {}, {
      hidden = true,
      filters = vim.tbl_deep_extend("force", opts.explorer and opts.explorer.filters or {}, {
        exclude = { "node_modules" }, -- <-- use 'exclude' for Snacks
      }),
    })
    -- explorer respects .gitignore
    opts.explorer = vim.tbl_deep_extend("force", opts.explorer or {}, {
      hidden = true,
      filters = {
        git_ignored = true,
      },
      sources = {
        { name = "buffers" },
      }
    })

    opts.indent = { enabled = false }

    -- pickers respect .gitignore
    opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
      files = {
        fd = {
          extra_args = { "--type", "f", "--hidden", "--exclude", ".git" },
        },
      },
      grep = {
        rg = {
          extra_args = { "--hidden", "--glob", "!.git/*" },
        },
      },
    })
    return opts
  end,
  keys = function(_, keys)
    table.insert(keys, {
      "<leader>e",
      function()
        local explorers = Snacks.picker.get({ source = "explorer" })
        if #explorers == 0 then
          Snacks.explorer()
        else
          explorers[1]:focus()
        end
      end,
      desc = "Explorer (focus or open)",
    })

    return keys
  end,
}
