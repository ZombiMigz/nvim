-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require("lspconfig")
lspconfig.qmlls.setup({
  cmd = { "pyside6-qmlls" },
})
lspconfig.tsserver.setup({
  -- Basic settings
  filetypes = { "typescript", "typescriptreact", "javascript" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json"),
})

vim.opt.mouse = "a"
