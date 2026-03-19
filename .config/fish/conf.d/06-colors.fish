# Syntax highlighting colors for fish
# Fish validates commands, paths, quotes, and more automatically
# These variables customize the color scheme

# Command validation
set -g fish_color_command green        # Valid command
set -g fish_color_error red           # Invalid command
set -g fish_color_param cyan          # Command parameters
set -g fish_color_option yellow       # Options/flags

# Strings and quotes
set -g fish_color_quote magenta       # Quoted strings
set -g fish_color_escape blue         # Escape sequences

# Paths and redirections
set -g fish_color_valid_path underline # Valid file paths (with underline)
set -g fish_color_redirection purple   # Redirection operators (>, <, |)

# Operators and separators
set -g fish_color_operator brcyan     # Operators like &&, ||, ;
set -g fish_color_end blue            # Line endings

# Comments and autosuggestions
set -g fish_color_comment brblack     # Comments
set -g fish_color_autosuggestion brblack # Dim autosuggestions

# Search and selection
set -g fish_color_search_match --background=brblack  # Search matches
set -g fish_color_selection --background=brblack     # Selected text

# Pager (completion menu)
set -g fish_pager_color_progress brwhite  # Progress indicator
set -g fish_pager_color_prefix cyan       # Matching prefix
set -g fish_pager_color_completion white  # Completion text
set -g fish_pager_color_description brblack # Descriptions

# Cursor
set -g fish_color_cwd green             # Current directory in prompt
set -g fish_color_cwd_root red          # Root directory in prompt
set -g fish_color_host blue             # Hostname
set -g fish_color_user brgreen          # Username