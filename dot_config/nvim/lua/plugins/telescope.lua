return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i, {
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-j>"] = actions.move_selection_next,
      -- ["<C-l>"] = actions.preview_scrolling_down,
      ["<C-h>"] = actions.preview_scrolling_up,
      ["<C-/>"] = actions.which_key,
    })
  end,
}
