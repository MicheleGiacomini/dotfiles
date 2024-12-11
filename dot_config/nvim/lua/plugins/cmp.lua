return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-cmdline" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    table.insert(opts.sources, {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    })
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-h>"] = cmp.mapping.scroll_docs(-4),
      ["<C-l>"] = cmp.mapping.scroll_docs(4),
    })
  end,
}
