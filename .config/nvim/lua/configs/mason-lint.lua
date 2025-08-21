local lint = package.loaded["lint"]

-- List of linters to ignore during install
local ignore_install = { "golangci_lint" }

-- Helper function to find if value is in table.
local function table_contains(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

-- local mason_name_map = {
--   golangci_lint = "golangci-lint",
-- }

-- Build a list of linters to install minus the ignored list.
local all_linters = {}
for _, v in pairs(lint.linters_by_ft) do
  -- if type(v) == "table" then
  for _, linter in ipairs(v) do
    if linter and not table_contains(ignore_install, linter) then
      -- local mason_name = mason_name_map[linter] or linter
      table.insert(all_linters, linter)
    end
  end
  -- end
end

require("mason-nvim-lint").setup {
  ensure_installed = all_linters,
  automatic_installation = false,
}
