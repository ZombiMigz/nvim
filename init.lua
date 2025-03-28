-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require("lspconfig")
lspconfig.qmlls.setup({
  cmd = { "pyside6-qmlls" },
})

vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = false

local osc52 = require("vim.ui.clipboard.osc52")
vim.keymap.set("v", "y", '"+y', { noremap = true })
vim.keymap.set("n", "p", '"+p', { noremap = true })
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = function()
      return { "" }
    end,
    ["*"] = function()
      return { "" }
    end,
  },
}
