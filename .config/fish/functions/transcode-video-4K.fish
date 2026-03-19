# Transcode a video to a balanced 4K suitable for sharing online
function transcode-video-4K
    set -l out (string replace -r '\.[^.]+$' '' $argv[1])-optimized.mp4
    ffmpeg -i $argv[1] -c:v libx265 -preset slow -crf 24 -c:a aac -b:a 192k $out
end
