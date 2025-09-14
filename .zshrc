# Created by newuser for 5.9
# --- Load your main zsh config ---
if [[ -f "$HOME/.config/zsh/rc" ]]; then
  source "$HOME/.config/zsh/rc"
fi

# --- Your overrides go here ---
# alias p='python'
# export EDITOR="nvim"
# export BAT_THEME="ansi"
export OMARCHY_SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

# Zinit installation (if not already installed)
if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
  mkdir -p ~/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

SSH_ENV="$HOME/.ssh/agent_env"

start_agent() {
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add -q ~/.ssh/id_ed25519 2>/dev/null
    echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > "$SSH_ENV"
    echo "export SSH_AGENT_PID=$SSH_AGENT_PID" >> "$SSH_ENV"
    chmod 600 "$SSH_ENV"
}

if [ -f "$SSH_ENV" ]; then
    source "$SSH_ENV" > /dev/null
    if ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
        start_agent
    fi
else
    start_agent
fi

source ~/.zinit/bin/zinit.zsh

# Initialize completions
# zmodload zsh/complist
# autoload -Uz compinit && compinit

zinit snippet OMZP::mise
zinit snippet OMZP::command-not-found

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

autoload -Uz compinit && compinit

zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

# source <(fzf --zsh)

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# . "$HOME/.local/share/../bin/env"
