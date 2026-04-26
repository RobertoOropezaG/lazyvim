-- React / TypeScript LSP setup
local keymaps = require("config.keymaps")

return {
    "neovim/nvim-lspconfig",
    ft = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    config = function()
        local lspconfig = require("lspconfig")

        -- TypeScript / React
        lspconfig.tsserver.setup({
            on_attach = function(client, bufnr)
                -- Disable formatting (use prettier instead)
                client.server_capabilities.documentFormattingProvider = false

                keymaps.setup_lsp_keymaps(bufnr)
                -- other attach logic if needed
            end,
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            },
        })

        -- ESLint (optional but recommended for React)
        lspconfig.eslint.setup({
            on_attach = function(_, bufnr)
                keymaps.setup_lsp_keymaps(bufnr)
            end,
        })
    end,
}
