# Remove the current git worktree and its branch
function gd
    if gum confirm "Remove worktree and branch?"
        set -l cwd (pwd)
        set -l worktree (basename $cwd)

        # Split on first '--'
        set -l root (string replace -r '--.*$' '' $worktree)
        set -l branch (string replace -r '^[^-]*--' '' $worktree)

        # Protect against accidentally nuking a non-worktree directory
        if test "$root" != "$worktree"
            cd "../$root"
            git worktree remove "$cwd" --force || return 1
            git branch -D "$branch"
        end
    end
end
