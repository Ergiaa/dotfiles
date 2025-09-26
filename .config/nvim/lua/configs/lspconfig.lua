local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- List of all servers you want to handle with Mason
vim.lsp.servers = {
  "cssls",
  "dockerls",
  "docker_compose_language_service",
  "eslint",
  "gopls",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "prismals",
  "pyright",
  "ts_ls",
  "yamlls",
  "java_language_server",
  "dotls",
  "terraformls",
}

-- Default servers (no special configs)
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
  "ts_ls",
  "yamlls",
  "java_language_server",
  "terraformls",
}

-- Register default configs
-- default setup for all servers
for _, lsp in ipairs(default_servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

-- lua_ls custom
vim.lsp.config("lua_ls", {
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
})
vim.lsp.enable "lua_ls"

-- gopls custom
vim.lsp.config("gopls", {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl", "gowork" },
  root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
})
vim.lsp.enable "gopls"
