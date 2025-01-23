return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "catppuccin/nvim",
  },
  opts = function()
    local colors = require("catppuccin.palettes").get_palette("mocha")

    return {
      handle = {
        color = colors.bg_highlight,
      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      },
    }
  end,
}
