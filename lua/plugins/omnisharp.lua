-- ~/.config/nvim/lua/plugins/omnisharp.lua
-- Set up LSP keymaps globally
local keymaps = require("config.keymaps")
return {
    "OmniSharp/omnisharp-roslyn",  -- just a placeholder name
    ft = { "cs" },                 -- only load for C# files
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.omnisharp.setup{
            cmd = { "C:\\Users\\orope\\.local\\OmniSharp\\OmniSharp.exe" },  -- path to Windows OmniSharp
            enable_roslyn_analyzers = true,
            root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
            settings = {
              omnisharp = {
                msbuild = {
                  enabled = true,
                  msbuildPath = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\MSBuild.exe",
                  -- msbuildPath = "C:\\Program Files\\dotnet\\sdk\\6.0.427\\MSBuild.dll",
                  useLegacySdkResolver = true,
                },
                -- TargetFramework = "net472"
              },
            },
            -- on_attach = function(client, bufnr)
            -- end,
            on_attach = function(client, bufnr)
                keymaps.setup_lsp_keymaps(bufnr)
                -- other attach logic
            end
        }
    end,
}

