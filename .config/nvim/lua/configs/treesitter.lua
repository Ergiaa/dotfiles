local options = {
  ensure_installed = {
    -- Core languages you actively use
    "bash", -- shell scripts
    "typescript", -- TypeScript
    "javascript", -- JavaScript
    "python", -- Python
    "go", -- Go
    "gomod",
    "gosum",
    "gotmpl",
    "gowork",
    "lua", -- Lua
    "java", -- Java
    "c_sharp", -- C#

    -- Markup / config formats
    "json", -- JSON
    "yaml", -- YAML
    "toml", -- TOML
    "dockerfile", -- Dockerfiles
    "markdown", -- Markdown
    "markdown_inline", -- For inline code blocks in Markdown
    "prisma", -- Prisma schema files
    "html", -- HTML templates
    "ini", -- Dotfiles

    -- Extras for Neovim itself
    "luadoc", -- Lua doc comments
    "vim", -- Vimscript
    "vimdoc", -- Vim help files

    -- Utilities / helpers
    "regex", -- Regex highlighting
    "printf", -- printf-like formats
    "terraform",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)

-- Map dotenv to use ini syntax highlighting
vim.treesitter.language.register("ini", "dotenv")
