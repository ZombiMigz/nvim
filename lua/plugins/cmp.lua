return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, { name = "emoji" })
    opts.mapping["<Up>"] = opts.mapping.select_prev_item()
    opts.mapping["<Down>"] = opts.mapping.select_next_item()
  end,
}
