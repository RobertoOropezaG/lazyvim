-- Set up LSP keymaps globally
local keymaps = require("config.keymaps")
return {
    "neovim/nvim-lspconfig",      -- This plugin is required for LSP configs, you probably already have it
    ft = { "python" },            -- only load for Python files
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.pyright.setup{
            on_attach = function(client, bufnr)
                keymaps.setup_lsp_keymaps(bufnr)
                -- other attach logic
            end,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic", -- or "strict"
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        }
    end,
}
