return {
  { "zbirenbaum/copilot-cmp", enabled = true },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = true },
    },
  },
}
