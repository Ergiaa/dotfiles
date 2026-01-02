require "nvchad.mappings"

local map = vim.keymap.set

-- ══════════════════════════════════════════════════════════════════════
-- General
-- ══════════════════════════════════════════════════════════════════════
map("n", ";", ":", { desc = "General Enter Cmdline" })
map("i", "jk", "<ESC>", { desc = "General Exit Insert Mode" })

-- ══════════════════════════════════════════════════════════════════════
-- Lazy Tools (<leader>l)
-- ══════════════════════════════════════════════════════════════════════
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { silent = true, desc = "Lazy Git UI" })
map("n", "<leader>ls", "<cmd>LazySql<cr>", { silent = true, desc = "Lazy SQL Client" })
map("n", "<leader>ld", function()
  require("lazydocker").toggle { engine = "docker" }
end, { silent = true, desc = "Lazy Docker" })
map("n", "<leader>lp", function()
  require("lazydocker").toggle { engine = "podman" }
end, { silent = true, desc = "Lazy Podman" })

-- ══════════════════════════════════════════════════════════════════════
-- Toggle (<leader>t)
-- ══════════════════════════════════════════════════════════════════════
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle Git Blame" })

-- ══════════════════════════════════════════════════════════════════════
-- Autolist
-- ══════════════════════════════════════════════════════════════════════
map("n", "<leader>cn", function()
  return require("autolist").cycle_next_dr()
end, { expr = true, desc = "List Cycle → Next" })
map("n", "<leader>cp", function()
  return require("autolist").cycle_prev_dr()
end, { expr = true, desc = "List Cycle → Prev" })
map("n", "dd", "dd<cmd>AutolistRecalculate<cr>", { desc = "List Delete Line + Recalc" })
map("v", "d", "d<cmd>AutolistRecalculate<cr>", { desc = "List Delete Selection + Recalc" })
map("n", ">>", ">><cmd>AutolistRecalculate<cr>", { desc = "List Indent + Recalc" })
map("n", "<<", "<<<cmd>AutolistRecalculate<cr>", { desc = "List Unindent + Recalc" })
