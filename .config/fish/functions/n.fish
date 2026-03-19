# nvim wrapper: open current directory if no args given
function n
    if test (count $argv) -eq 0
        command nvim .
    else
        command nvim $argv
    end
end
