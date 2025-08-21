**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1. Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

# Requirements

1. Install Go (1.24.6)
2. Install Java JDK (21)
3. Install Node (22)
4. Install Python

# Steps

Clean up cache.

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

Clean up Neovim configuration (if exists).

```bash
rm -rf ~/.config/nvim
```

After copying the config (use stow), let Lazy install required plugins, then run this.

```bash
:MasonInstallAll
```
