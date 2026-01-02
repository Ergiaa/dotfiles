require "nvchad.autocmds"

vim.filetype.add {
  filename = {
    [".env"] = "dotenv", -- exact match
  },
  pattern = {
    [".*%.env.*"] = "dotenv", -- matches .env, .env.local, .env.production, etc.
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    local opt = vim.opt_local
    opt.shiftwidth = 4
    opt.tabstop = 4
    opt.softtabstop = 4
  end,
})
