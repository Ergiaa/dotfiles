local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
  -- "bashls", -- bash-language-server
  "cssls", -- css-lsp
  "dockerls", -- dockerfile-language-server
  "docker_compose_language_service", -- docker-compose-language-service
  "eslint", -- eslint_d (via LSP)
  "gopls", -- gopls (Go)
  "html", -- html-lsp
  "jsonls", -- json-lsp
  "lua_ls", -- lua-language-server
  "marksman", -- markdown
  "prismals", -- prisma-language-server
  "pyright", -- pyright (Python)
  -- "shfmt", -- shfmt (usually a formatter, but has LSP hooks too)
  "ts_ls", -- typescript-language-server (✅ correct as per lspconfig)
  "yamlls", -- yaml-language-server
  "java_language_server", -- java-language-server
  "dotls", -- dot-language-server
  "terraformls",
}

-- list of servers configured with default config.
local default_servers = {
  "bashls",
  "cssls",
  "dockerls",
  "docker_compose_language_service",
  "eslint",
  "html",
  "jsonls",
  "marksman",
  "prismals",
  "pyright",
  -- "shfmt",
  "ts_ls",
  "yamlls",
  "java_language_server",
  "terraformls",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl", "gowork" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
}
