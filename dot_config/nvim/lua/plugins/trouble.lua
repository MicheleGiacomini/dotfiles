return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>xe",
      "<cmd>Trouble errors toggle<cr>",
      desc = "Errors (Trouble)",
    },
    {
      "<leader>xE",
      "<cmd>Trouble errors toggle filter.buf=0<cr>",
      desc = "Buffer errors (Trouble)",
    },
  },
  opts = {
    modes = {
      errors = {
        mode = "diagnostics",
        filter = {
          severity = vim.diagnostic.severity.ERROR,
        },
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
}
