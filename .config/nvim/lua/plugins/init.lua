return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.treesitter"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },
  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = function()
      require "configs.mason-conform"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    config = function()
      require "configs.mason-lint"
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      -- "echasnovski/mini.nvim", -- if you use the mini.nvim suite
      -- "echasnovski/mini.icons", -- if you use standalone mini plugins
      "nvim-tree/nvim-web-devicons", -- if you prefer nvim-web-devicons
    },
    config = function()
      require "configs.render-markdown"
    end,
  },
  {
    "gaoDean/autolist.nvim",
    ft = { "markdown", "text", "tex", "plaintex", "norg" },
    config = function()
      require "configs.autolist"
    end,
  },
  -- {
  --   "folke/snacks.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   config = function()
  --     require "configs.snacks"
  --   end,
  -- },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   lazy = false,
  --   -- cmd = {
  --   --   "TmuxNavigateLeft",
  --   --   "TmuxNavigateDown",
  --   --   "TmuxNavigateUp",
  --   --   "TmuxNavigateRight",
  --   --   "TmuxNavigatePrevious",
  --   --   "TmuxNavigatorProcessList",
  --   -- },
  --   -- keys = {
  --   --   { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  --   --   { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  --   --   { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  --   --   { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  --   --   { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  --   -- },
  -- },
  -- Custom Parameters (with defaults)
  {
    "David-Kunz/gen.nvim",
    lazy = false,
    config = function()
      require("gen").setup {
        -- model = "deepseek-coder:6.7b-instruct",
        -- model = "deepseek-coder-v2:16b-lite-instruct-q4_0",
        model = "qwen2.5-coder:7b-instruct",
        host = "localhost",
        port = "11434",
        display_mode = "float",
        quit_map = "q",
        retry_map = "<c-r>",
        accept_map = "<c-cr>",
        show_prompt = false,
        show_model = false,
      }

      -- load custom prompts
      require "configs.gen-prompts"
    end,
  },
}
