return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      nushell = {},
    },

    -- servers = {
    --   ocamllsp = {
    --     settings = {
    --       codelens = { enable = true },
    --     },
    --
    --     get_language_id = function(_, ftype)
    --       return ftype
    --     end,
    --   },
    -- },
    -- setup = {
    --   ocamllsp = function()
    --     local autocmd = vim.api.nvim_create_autocmd
    --     local autocmd_clear = vim.api.nvim_clear_autocmds
    --     local augroup_codelens = vim.api.nvim_create_augroup("custom-lsp-codelens", { clear = true })
    --     require("lazyvim.util").lsp.on_attach(function(_, buffer)
    --       autocmd_clear({ group = augroup_codelens, buffer = 0 })
    --       autocmd({ "BufEnter", "BufWritePost", "CursorHold" }, {
    --         pattern = { "*.ml" },
    --         group = augroup_codelens,
    --         callback = function()
    --           vim.lsp.codelens.refresh()
    --         end,
    --         -- buffer = buffer,
    --       })
    --     end)
    --   end,
    -- },
  },
}
