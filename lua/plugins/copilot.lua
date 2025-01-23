return {
  -- disable copilot-cmp
  { "zbirenbaum/copilot-cmp", enabled = false },

  -- configure copilot.lua
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<A-L>",
        },
      },
      panel = { enabled = true },
    },
  },
}
