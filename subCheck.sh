#!/bin/bash

input_video="$1"

subtitle_index=$(ffprobe -v error -select_streams s -show_entries stream=index:stream_tags=language -of default=nw=1:nk=1 "$input_video" | awk '/^eng$/{print NR-1; exit}')
ffmpeg -i "$input_video" -map 0:s:"$subtitle_index" -c:s srt output.srt
