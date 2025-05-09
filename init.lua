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

-- Use system clipboard by default
vim.opt.clipboard = "unnamedplus"
-- Enable yanking to system clipboard
local osc52 = require("vim.ui.clipboard.osc52")
vim.keymap.set("v", "y", function()
  -- First yank to the unnamed register
  vim.cmd("normal! y")
  -- Now also yank to the system clipboard
  local content = vim.fn.getreg('"')
  vim.fn.setreg("+", content)
  vim.fn.setreg("*", content)
end, { noremap = true })
-- Add OSC 52 support
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = function()
      return { { "" }, "v" }
    end,
    ["*"] = function()
      return { { "" }, "v" }
    end,
  },
}
