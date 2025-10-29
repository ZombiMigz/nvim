return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = { enabled = true },
      -- picker = { enabled = true, ui_select = true },
      scroll = { enabled = true },
      -- explorer = { enabled = true },
      -- statuscolumn = { enabled = true },
      notify = { enabled = true },
      notifier = { enabled = true },
    },
    -- keys = {
    --   -- Top Pickers & Explorer
    --   {
    --     "<leader><space>",
    --     function()
    --       Snacks.picker.smart()
    --     end,
    --     desc = "Smart Find Files",
    --   },
    --   {
    --     "<leader>/",
    --     function()
    --       Snacks.picker.grep()
    --     end,
    --     desc = "Find Text in Files",
    --   },
    --   {
    --     "<leader>e",
    --     function()
    --       Snacks.explorer.open()
    --     end,
    --     desc = "Snacks Explorer",
    --   },
    -- },
    dependencies = {
      "kiyoon/magick.nvim",
    },
  },
}
