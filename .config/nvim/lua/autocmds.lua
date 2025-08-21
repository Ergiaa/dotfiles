require "nvchad.autocmds"

vim.filetype.add {
  filename = {
    [".env"] = "dotenv", -- exact match
  },
  pattern = {
    [".*%.env.*"] = "dotenv", -- matches .env, .env.local, .env.production, etc.
  },
}
