local options = {
  formatters_by_ft = {
    -- Lua
    lua = { "stylua" },

    -- Web
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },

    -- Data / config
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    toml = { "prettier" }, -- good for config files
    ini = { "ini_fmt" },
    dotenv = { "dotenv_linter" },

    -- Markdown & docs
    markdown = { "prettier" },
    markdown_inline = { "prettier" },

    -- Go
    go = { "gofumpt", "goimports-reviser", "golines" },

    -- Python
    python = { "isort", "black" }, -- or "isort" + "black" if sorting imports

    -- Prisma
    -- prisma = { "prisma_fmt" },

    -- Shell
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },

    -- Docker
    dockerfile = { "prettier" },
  },
  formatters = {
    -- Go
    ["goimports-reviser"] = {
      prepend_args = { "-rm-unused" },
    },
    golines = {
      prepend_args = { "--max-len=80" },
    },
    -- Python
    black = {
      prepend_args = {
        "--fast",
        "--line-length",
        "80",
      },
    },
    isort = {
      prepend_args = {
        "--profile",
        "black",
      },
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
