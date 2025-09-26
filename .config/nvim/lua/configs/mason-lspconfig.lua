-- List of servers to ignore during install
local ignore_install = {}

-- Helper function to check if a value is in a table
local function table_contains(tbl, value)
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end

-- Build a list of lsp servers to install (excluding ignored)
local all_servers = {}
for _, s in ipairs(vim.lsp.servers or {}) do
  if not table_contains(ignore_install, s) then
    table.insert(all_servers, s)
  end
end

require("mason-lspconfig").setup {
  ensure_installed = all_servers,
  automatic_installation = false,
}
