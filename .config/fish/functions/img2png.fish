# Convert any image to a compressed-but-lossless PNG
function img2png
    set -l img $argv[1]
    set -l rest $argv[2..]
    set -l out (string replace -r '\.[^.]+$' '' $img)-optimized.png
    magick $img $rest -strip \
        -define png:compression-filter=5 \
        -define png:compression-level=9 \
        -define png:compression-strategy=1 \
        -define png:exclude-chunk=all \
        $out
end
