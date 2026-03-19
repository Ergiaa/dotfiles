# mise (version manager) - cached for performance
if command -q mise
    if not test -f ~/.cache/mise-init.fish; or test (command -v mise) -nt ~/.cache/mise-init.fish
        mkdir -p ~/.cache
        mise activate fish > ~/.cache/mise-init.fish
    end
    source ~/.cache/mise-init.fish
end

# zoxide (smart cd) - cached for performance
if command -q zoxide
    if not test -f ~/.cache/zoxide-init.fish; or test (command -v zoxide) -nt ~/.cache/zoxide-init.fish
        mkdir -p ~/.cache
        zoxide init fish > ~/.cache/zoxide-init.fish
    end
    source ~/.cache/zoxide-init.fish
end

# fzf (fuzzy finder) - cached for performance
if command -q fzf
    if not test -f ~/.cache/fzf-init.fish; or test (command -v fzf) -nt ~/.cache/fzf-init.fish
        mkdir -p ~/.cache
        fzf --fish > ~/.cache/fzf-init.fish
    end
    source ~/.cache/fzf-init.fish
end

# Starship transient prompt functions
function starship_transient_prompt_func
    starship module character
end

function starship_transient_rprompt_func
    starship module time
end

# starship prompt - cached for performance
if command -q starship
    if not test -f ~/.cache/starship-init.fish; or test (command -v starship) -nt ~/.cache/starship-init.fish
        mkdir -p ~/.cache
        starship init fish > ~/.cache/starship-init.fish
    end
    source ~/.cache/starship-init.fish
    enable_transience
end
