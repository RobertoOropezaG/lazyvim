return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {
          filetypes = {
            'astro',
            'css',
            'eruby',
            'html',
            'htmlangular',
            'htmldjango',
            'javascriptreact',
            'less',
            'sass',
            'scss',
            'svelte',
            'typescriptreact',
            'vue',
          },
        },
        -- emmet_ls = {},
      },
    },
  },
}
