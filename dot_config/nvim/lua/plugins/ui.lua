return {
  "echasnovski/mini.indentscope",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = "LazyFile",
  opts = {
    draw = {
      animation = function()
        return 0
      end,
    },
  },
}
