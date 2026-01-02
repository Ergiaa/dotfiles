local lint = require "lint"

-- Assigning linters
lint.linters_by_ft = {
  -- Lua
  lua = { "luacheck" },

  -- JavaScript / TypeScript
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },

  -- Python
  -- python = { "flake8" }, -- or "flake8" / "ruff" if preferred

  -- Go
  go = { "golangci_lint" },

  -- Shell
  -- sh = { "shellcheck" },
  -- bash = { "shellcheck" },
  -- zsh = { "shellcheck" },

  -- YAML
  -- yaml = { "yamllint" },

  -- Docker
  dockerfile = { "hadolint" },
}

-- Adding custom args
lint.linters.luacheck.args = {
  unpack(lint.linters.luacheck.args),
  "--globals",
  "vim",
}

lint.linters.eslint_d.args = { unpack(lint.linters.eslint_d.args) }

-- Autocmd for lint trigger
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
