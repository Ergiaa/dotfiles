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

-- autolist.nvim (list continuation)

-- Insert mode
map("i", "<tab>", "<cmd>AutolistTab<cr>", { desc = "Autolist indent" })
map("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>", { desc = "Autolist unindent" })
-- map("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- Optional: indent + recalc
map("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", { desc = "New bullet" })

-- Normal mode
map("n", "o", "o<cmd>AutolistNewBullet<cr>", { desc = "New bullet below" })
map("n", "O", "O<cmd>AutolistNewBulletBefore<cr>", { desc = "New bullet above" })
map("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", { desc = "Toggle checkbox" })
map("n", "<C-r>", "<cmd>AutolistRecalculate<cr>", { desc = "Recalculate list" })

-- Cycle list types
map("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true, desc = "Next list type" })
map("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true, desc = "Prev list type" })
-- If you don't want dot-repeat:
-- map("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
-- map("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

-- Auto-recalc after edits
map("n", ">>", ">><cmd>AutolistRecalculate<cr>", { desc = "Indent + recalc" })
map("n", "<<", "<<<cmd>AutolistRecalculate<cr>", { desc = "Unindent + recalc" })
map("n", "dd", "dd<cmd>AutolistRecalculate<cr>", { desc = "Delete line + recalc" })
map("v", "d", "d<cmd>AutolistRecalculate<cr>", { desc = "Delete selection + recalc" })

-- Visual/normal mode keymapping style
map("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true, desc = "LazyGit" })

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
