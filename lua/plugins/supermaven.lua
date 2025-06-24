return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    cmd = {
      "SupermavenUseFree",
      "SupermavenUsePro",
    },
    opts = function()
      require("supermaven-nvim.completion_preview").suggestion_group = "SupermavenSuggestion"
      LazyVim.cmp.actions.ai_accept = function()
        local suggestion = require("supermaven-nvim.completion_preview")
        if suggestion.has_suggestion() then
          LazyVim.create_undo()
          vim.schedule(function()
            suggestion.on_accept_suggestion()
          end)
          return true
        end
      end

      return {
        keymaps = {
          accept_suggestion = "<Tab>", -- handled by nvim-cmp / blink.cmp
        },
        ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
      }
    end,
  },
}
