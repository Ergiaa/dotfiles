# Transcode a video to a balanced 1080p suitable for sharing online
function transcode-video-1080p
    set -l out (string replace -r '\.[^.]+$' '' $argv[1])-1080p.mp4
    ffmpeg -i $argv[1] -vf scale=1920:1080 -c:v libx264 -preset fast -crf 23 -c:a copy $out
end
