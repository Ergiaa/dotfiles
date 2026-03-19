# Interactive zoxide directory picker
function ci
    builtin cd (zoxide query -i) && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
end
