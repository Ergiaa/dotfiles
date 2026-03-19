# Smart cd: go home with no args, use real cd for directories,
# fall back to zoxide for fuzzy matching
# Using __smart_cd name prevents fish from applying directory validation highlighting
function __smart_cd
    if test (count $argv) -eq 0
        builtin cd ~
    else if test -d $argv[1]
        builtin cd $argv[1]
    else
        z $argv && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
    end
end

# Alias so users can still type 'cd'
alias cd __smart_cd
