# Editor
set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim

# Bat settings
set -gx BAT_THEME ansi

# Omarchy
set -gx OMARCHY_SCREENSHOT_DIR $HOME/Pictures/Screenshots

# PATH
fish_add_path ./bin $HOME/.local/bin $HOME/.cache/.bun/bin $HOME/.cargo/bin
