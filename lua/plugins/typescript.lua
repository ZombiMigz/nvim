return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
        settings = {
          typescript = {
            tsserver = {
              maxTsServerMemory = 6144,
            },
          },
        },
      },
    },
  },
}
