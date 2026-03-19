# Convert any image to a small JPG (max 1080px wide, great for sharing online)
function img2jpg-small
    set -l img $argv[1]
    set -l rest $argv[2..]
    set -l out (string replace -r '\.[^.]+$' '' $img)-small.jpg
    magick $img $rest -resize '1080x>' -quality 95 -strip $out
end
