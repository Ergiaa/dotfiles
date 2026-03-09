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

local function reload_omarchy_theme()
  package.loaded["themes.omarchy"] = nil
  package.loaded["base46.themes.omarchy"] = nil
  vim.g.base46_theme = nil

  require("nvconfig").base46.theme = "omarchy"
  require("base46").load_all_highlights()

  local ok, reload = pcall(require, "plenary.reload")
  if ok then
    reload.reload_module "volt.highlights"
    require "volt.highlights"
  end
end

vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    local theme_file = vim.fn.expand "~/.config/omarchy/current/theme/colors.toml"
    local current_mtime = vim.fn.getftime(theme_file)
    local last_mtime = vim.g.omarchy_theme_mtime or 0

    if current_mtime > last_mtime then
      vim.g.omarchy_theme_mtime = current_mtime
      reload_omarchy_theme()
    end
  end,
  desc = "Check for Omarchy theme changes on startup",
})

vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    local theme_file = vim.fn.expand "~/.config/omarchy/current/theme/colors.toml"
    local current_mtime = vim.fn.getftime(theme_file)
    local last_mtime = vim.g.omarchy_theme_mtime or 0

    if current_mtime > last_mtime then
      vim.g.omarchy_theme_mtime = current_mtime
      reload_omarchy_theme()
    end
  end,
  desc = "Reload Omarchy theme when gaining focus if file changed",
})

vim.api.nvim_create_user_command("ReloadOmarchyTheme", reload_omarchy_theme, {
  desc = "Manually reload Omarchy theme",
})
