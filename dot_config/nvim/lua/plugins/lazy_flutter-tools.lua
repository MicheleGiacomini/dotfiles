-- NOTE: tools to handle Dart/Flutter projects, including language server

return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  opts = {
    fvm = true,
    debugger = {
      enabled = true,
      run_via_dap = true,
      register_configurations = function(_)
        local dap = require("dap")
        dap.adapters.dart = {
          type = "executable",
          command = "dart",
          args = { "debug_adapter" },
        }
        dap.adapters.flutter = {
          type = "executable",
          command = "flutter",
          args = { "debug_adapter" },
        }
        dap.configurations.dart = {
          {
            type = "dart",
            request = "launch",
            name = "Launch dart",
            dartSdkPath = "/var/lib/snapd/snap/bin/dart",
            flutterSdkPath = "/var/lib/snapd/snap/bin/flutter", -- ensure this is correct
            program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
            cwd = "${workspaceFolder}",
          },
          {
            type = "flutter",
            request = "launch",
            name = "Launch flutter",
            dartSdkPath = "/var/lib/snapd/snap/bin/dart",
            flutterSdkPath = "/var/lib/snapd/snap/bin/flutter", -- ensure this is correct
            program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
            cwd = "${workspaceFolder}",
          },
        }
        -- require("dap.ext.vscode").load_launchjs()
      end,
    },
    lsp = {
      color = { -- show the derived colours for dart variables
        enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        background = false, -- highlight the background
        background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
        foreground = false, -- highlight the foreground
        virtual_text = true, -- show the highlight using virtual text
        virtual_text_str = "■", -- the virtual text character to highlight
      },
      settings = {
        showTodos = false,
        completeFunctionCalls = true,
        -- analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
        renameFilesWithClasses = "prompt", -- "always"
        enableSnippets = true,
        updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
      },
    },
  },
}
