# Convert any image to a high-quality JPG (great for shrinking wallpapers)
function img2jpg
    set -l img $argv[1]
    set -l rest $argv[2..]
    set -l out (string replace -r '\.[^.]+$' '' $img)-converted.jpg
    magick $img $rest -quality 95 -strip $out
end
