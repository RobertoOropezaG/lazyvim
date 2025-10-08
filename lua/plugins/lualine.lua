return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_z = {
      function()
        return "󰦨 " .. vim.fn.line("$")
      end,
    }
    opts.sections.lualine_a = {
      {
        'mode',
        fmt = function(str)
          local map = {
            NORMAL = 'N',
            INSERT = 'I',
            VISUAL = 'V',
            ['V-LINE'] = 'VL',
            ['V-BLOCK'] = 'VB',
            REPLACE = 'R',
            COMMAND = 'C',
            TERMINAL = 'T',
          }
          return map[str] or str
        end,
      }
    }
  end
}
