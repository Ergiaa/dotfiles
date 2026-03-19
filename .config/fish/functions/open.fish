# Open files/directories with default application
function open
    xdg-open $argv > /dev/null 2>&1 &
end
