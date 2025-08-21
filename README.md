# Dotfiles

My personal dotfiles for system configuration.

## Requirements

- **Git**

```bash
pacman -S git
```

- **GNU Stow**

```bash
pacman -S stow
```

## Installation

Clone the repository into your `$HOME` directory:

```bash
git clone git@github.com:Ergiaa/dotfiles.git ~/dotfiles
cd dotfiles
```

Use GNU Stow to create symlinks:

```bash
stow .
```
