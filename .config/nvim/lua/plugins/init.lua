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
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    config = function()
      -- Optional: any additional setup can go here
      -- For example, setting up window options if desired
      -- require("lazygit").setup({})
    end,
  },
  {
    "LostbBlizzard/lazysql.nvim",
    lazy = true,
    cmd = {
      "LazySql",
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>ls", "<cmd>LazySql<cr>", desc = "LazySql" },
    },
    config = function()
      require("lazysql").setup {}
    end,
  },
  {
    "crnvl96/lazydocker.nvim",
    lazy = true,
    cmd = {
      "LazyDockerToggle",
    },
    -- keys = {
    --   {
    --     "<leader>ld",
    --     function()
    --       require("lazydocker").toggle()
    --     end,
    --     desc = "Toggle LazyDocker",
    --   },
    -- },
    config = function()
      require("lazydocker").setup {
        window = {
          settings = {
            width = 0.618,
            height = 0.618,
            border = "rounded",
            relative = "editor",
          },
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = "<C-l>", -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
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
