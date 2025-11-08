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
      picker = {
        enabled = true,
        ui_select = true,
      },
      scroll = { enabled = true },
      -- explorer = { enabled = true },
      -- statuscolumn = { enabled = true },
      notify = { enabled = true },
      notifier = { enabled = true },
    },
    keys = {
      -- Top Pickers & Explorer
      {
        "<leader><space>",
        function()
          Snacks.picker.smart({ cwd = vim.fn.getcwd(-1, -1) })
        end,
        desc = "Find Files (Root)",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep({ cwd = vim.fn.getcwd(-1, -1) })
        end,
        desc = "Grep (Root)",
      },
    },
    dependencies = {
      "kiyoon/magick.nvim",
    },
  },
}
