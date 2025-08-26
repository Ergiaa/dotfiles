local render = require "render-markdown"

---@module 'render-markdown'
---@type rnder.md.UserConfig
render.setup {
  -- Your options here
  preset = "obsidian",
  completions = {
    lsp = {
      enabled = true,
    },
  },
  heading = {
    border = true,
  },
  indent = {
    enabled = true,
    skip_heading = true,
  },
}
