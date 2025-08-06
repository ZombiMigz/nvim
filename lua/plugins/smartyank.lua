return {
  "ibhagwan/smartyank.nvim",
  config = function()
    require("smartyank").setup({
      osc52 = {
        enabled = true,
        ssh_only = false,
      },
    })
  end,
}
