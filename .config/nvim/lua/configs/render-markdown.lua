local render = require "render-markdown"

---@module 'render-markdown'
---@type rnder.md.UserConfig
render.setup {
  -- Your options here
  completions = {
    lsp = {
      enabled = true,
    },
  },
}
