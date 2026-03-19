# File system
alias ls 'eza -lh --group-directories-first --icons=auto'
alias lsa 'ls -a'
alias lt 'eza --tree --level=2 --long --icons --git --group-directories-first --git-ignore'
alias lta 'eza --tree --level=2 --long --icons --git --group-directories-first -a'
alias ff "fzf --preview 'bat --style=numbers --color=always {}'"
alias eff '$EDITOR (ff)'
alias man batman

# Directories
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'

# Tools
alias c opencode
alias cx 'printf "\033[2J\033[3J\033[H" && claude --allow-dangerously-skip-permissions'
alias lg lazygit
alias d docker
alias r rails
alias t 'tmux attach || tmux new -s Work'

# Compression
alias decompress 'tar -xzf'
