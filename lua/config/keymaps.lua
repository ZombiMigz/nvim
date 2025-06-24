-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<Esc>", function()
  local blink = require("blink.cmp")

  local suggestion_closed = false

  -- Check if blink.cmp is visible
  if blink.is_visible() then
    blink.hide()
    suggestion_closed = true
  end

  -- Check if supermaven has a suggestion and clear it
  local supermaven = require("supermaven-nvim.completion_preview")
  if supermaven.has_suggestion() then
    supermaven.on_dispose_inlay()
    suggestion_closed = true
  end

  if suggestion_closed then
    return ""
  end

  -- If neither are active, normal escape behavior
  return "<Esc>"
end, { expr = true, silent = true })
