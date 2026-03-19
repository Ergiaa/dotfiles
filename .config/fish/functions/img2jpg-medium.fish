# Convert any image to a medium JPG (max 1800px wide, great for sharing online)
function img2jpg-medium
    set -l img $argv[1]
    set -l rest $argv[2..]
    set -l out (string replace -r '\.[^.]+$' '' $img)-medium.jpg
    magick $img $rest -resize '1800x>' -quality 95 -strip $out
end
