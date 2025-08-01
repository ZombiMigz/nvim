-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require("lspconfig")
lspconfig.qmlls.setup({
  cmd = { "pyside6-qmlls" },
})
-- Github actions support, may be removed once Mason PR is merged here:
-- https://github.com/lttb/gh-actions-language-server?tab=readme-ov-file
vim.filetype.add({
  pattern = {
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
})
require("lspconfig").gh_actions_ls.setup({})

vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = false
