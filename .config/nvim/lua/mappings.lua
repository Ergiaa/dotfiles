require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- Basic
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Neovim-Tmux Navigator
-- map("n", "C-h", ":TmuxNavigateLeft<CR>")
-- map("n", "C-j", ":TmuxNavigateDown<CR>")
-- map("n", "C-k", ":TmuxNavigateUp<CR>")
-- map("n", "C-l", ":TmuxNavigateRight<CR>")

-- =========================
-- Gen.nvim (visual selection & chat)
-- =========================
map("v", "<leader>cf", ":Gen Fix_Code<CR>", { desc = "Fix Selected Code" })
map("v", "<leader>ce", ":Gen Explain_Function<CR>", { desc = "Explain Function or Code Snippet" })
map("v", "<leader>cr", ":Gen Review_Code<CR>", { desc = "Generate Code Review" })
map("v", "<leader>ct", ":Gen Generate_Tests<CR>", { desc = "Generate Unit Tests" })
map("v", "<leader>co", ":Gen Optimize_Code<CR>", { desc = "Optimize Selected Code" })
map("v", "<leader>cd", ":Gen Add_Documentation<CR>", { desc = "Add Documentation/Comments" })
map("v", "<leader>cR", ":Gen Refactor<CR>", { desc = "Refactor Selected Code" })

map("n", "<leader>cc", ":Gen Chat<CR>", { desc = "Start Gen Chat" })

-- =========================
-- Avante.nvim (completion & toggle)
-- =========================
-- Accept suggestion (like Copilot <Tab>)
-- map("i", "<Tab>", function()
--   if require("avante.completion").has_suggestion() then
--     return require("avante.completion").accept()
--   end
--   return "<Tab>"
-- end, { expr = true, desc = "Accept Avante suggestion" })
--
-- -- Navigate suggestions
-- map("i", "<C-n>", function()
--   if require("avante.completion").has_suggestion() then
--     return require("avante.completion").next()
--   end
--   return "<C-n>"
-- end, { expr = true, desc = "Next Avante suggestion" })
--
-- map("i", "<C-p>", function()
--   if require("avante.completion").has_suggestion() then
--     return require("avante.completion").prev()
--   end
--   return "<C-p>"
-- end, { expr = true, desc = "Previous Avante suggestion" })
--
-- -- Dismiss suggestion
-- map("i", "<C-]>", function()
--   require("avante.completion").dismiss()
-- end, { desc = "Dismiss Avante suggestion", silent = true, noremap = true })
--
-- -- Toggle Avante on/off
-- map("n", "<leader>ta", "<cmd>AvanteToggle<CR>", { desc = "Toggle Avante AI" })
