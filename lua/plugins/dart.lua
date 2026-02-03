return {
  "nvim-flutter/flutter-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    ui = {
      -- border = "rounded",
    },
    flutter_lookup_cmd = "mise where flutter",
    lsp = {
      color = {
        -- enabled = true,
      },

      -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
      settings = {
        lineLength = 120,
        showTodos = false,

        -- completeFunctionCalls = true,
        -- renameFilesWithClasses = true,
        analysisExcludedFolders = { "build", ".dart_tool", ".idea", ".pub", ".git" },
      },
    },
  },
}
