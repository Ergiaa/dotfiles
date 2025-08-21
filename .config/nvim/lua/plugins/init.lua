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

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "stevearc/dressing.nvim", -- for input provider dressing
  --     "folke/snacks.nvim", -- for input provider snacks
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  --   build = "make", -- kalau pakai telescope fzf, ini opsional
  --   config = function()
  --     require("avante").setup {
  --       provider = "ollama",
  --       providers = {
  --         ollama = {
  --           model = "qwen2.5-coder:7b-instruct",
  --           endpoint = "http://127.0.0.1:11434",
  --           timeout = 30000,
  --         },
  --       },
  --     }
  --   end,
  -- },
}
