require "nvchad.mappings"

local map = vim.keymap.set

-- Basic
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- autolist.nvim - Cycle list types (lazy require to avoid startup load)
map("n", "<leader>cn", function()
  return require("autolist").cycle_next_dr()
end, { expr = true, desc = "Next list type" })
map("n", "<leader>cp", function()
  return require("autolist").cycle_prev_dr()
end, { expr = true, desc = "Prev list type" })

-- Auto-recalc after edits
map("n", ">>", ">><cmd>AutolistRecalculate<cr>", { desc = "Indent + recalc" })
map("n", "<<", "<<<cmd>AutolistRecalculate<cr>", { desc = "Unindent + recalc" })
map("n", "dd", "dd<cmd>AutolistRecalculate<cr>", { desc = "Delete line + recalc" })
map("v", "d", "d<cmd>AutolistRecalculate<cr>", { desc = "Delete selection + recalc" })

-- Lazy tools
map("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true, desc = "LazyGit" })
map("n", "<leader>ls", ":LazySql<CR>", { noremap = true, silent = true, desc = "LazySql" })
map(
  "n",
  "<leader>ld",
  ":lua require('lazydocker').toggle({ engine = 'docker' })<CR>",
  { noremap = true, silent = true, desc = "LazyDocker (docker)" }
)
map(
  "n",
  "<leader>lp",
  ":lua require('lazydocker').toggle({ engine = 'podman' })<CR>",
  { noremap = true, silent = true, desc = "LazyDocker (podman)" }
)

-- gitsigns
map("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Git toggle blame" })
