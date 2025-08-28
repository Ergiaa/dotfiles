# Created by newuser for 5.9
# --- Load your main zsh config ---
if [[ -f "$HOME/.config/zsh/rc" ]]; then
  source "$HOME/.config/zsh/rc"
fi

# --- Your overrides go here ---
# alias p='python'
# export EDITOR="nvim"
# export BAT_THEME="ansi"

# Zinit installation (if not already installed)
if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
  mkdir -p ~/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

source ~/.zinit/bin/zinit.zsh

# Initialize completions
autoload -Uz compinit && compinit

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

source <(fzf --zsh)

. "$HOME/.local/share/../bin/env"
