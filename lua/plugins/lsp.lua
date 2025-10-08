-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        vtsls = function(_, opts)
          local lspconfig = require("lspconfig")
          local keymaps = require("config.keymaps")
          opts.on_attach = function(client, bufnr)
              -- keep LazyVim's default on_attach
            if require("lazyvim.util").lsp.on_attach then
              require("lazyvim.util").lsp.on_attach(client, bufnr)
            end

            -- ✅ Your custom mapping
            -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
            keymaps.setup_lsp_keymaps(bufnr)
          end

          lspconfig.vtsls.setup(opts)
          return true -- tell LazyVim we did the setup
        end,
      },
    },
  },
}
