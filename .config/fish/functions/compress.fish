# Compress a file or directory into a .tar.gz archive
function compress
    set -l target (string replace -r '/$' '' $argv[1])
    tar -czf "$target.tar.gz" $target
end
