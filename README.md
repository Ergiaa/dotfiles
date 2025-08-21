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

## Commit Message Guidelines

To keep commit history clear and consistent, use the following prefixes:

### General (Conventional Commits)

- **feat:** Add new configuration or functionality
  _Example:_ `feat: add neovim LSP config`
- **fix:** Fix broken config or errors
  _Example:_ `fix: correct tmux keybinding`
- **refactor:** Improve structure without changing behavior
  _Example:_ `refactor: split zsh aliases into separate file`
- **style:** Cosmetic changes only (spacing, comments, order)
  _Example:_ `style: align comments in .gitconfig`
- **docs:** Documentation changes (README, comments)
  _Example:_ `docs: update installation instructions`
- **chore:** Maintenance tasks and dependency updates
  _Example:_ `chore: update stow package list`
- **perf:** Performance improvements in scripts/config
  _Example:_ `perf: optimize shell prompt rendering`
- **test:** Adding/updating test scripts
  _Example:_ `test: add script to check broken symlinks`

### Dotfiles-Specific

- **alias:** Adding/changing shell aliases
  _Example:_ `alias: add gs for git status`
- **plugin:** Adding/updating plugins (vim, tmux, zsh)
  _Example:_ `plugin: add fzf.vim to plugin list`
- **env:** Environment variable changes
  _Example:_ `env: add GOPATH to zshrc`
- **config:** Adding/updating config files
  _Example:_ `config: add new alacritty theme`
- **script:** Adding/updating helper scripts
  _Example:_ `script: add backup.sh for dotfiles`

### Special Cases

- **init:** Initial commit or setup
  _Example:_ `init: initial dotfiles commit`
- **merge:** Merging branches
  _Example:_ `merge: branch 'feature/zsh-update'`
- **revert:** Reverting a commit
  _Example:_ `revert: remove broken nvim plugin
