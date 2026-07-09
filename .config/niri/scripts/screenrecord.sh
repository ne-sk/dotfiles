#!/bin/bash

state_file="/tmp/wf-recorder-filename"

if pgrep -x wf-recorder > /dev/null; then
  process_id=$(pgrep -x wf-recorder)
  kill -SIGINT $process_id
  sleep 1

  filename=$(cat "$state_file")
  mv "$filename" ~/Videos/Screencasts/
  notify-send -t 3000 "Screen recording finished" "$filename saved"
  rm "$state_file"
else
  filename=$(date +%s).mkv
  echo "$filename" > "$state_file"
  wf-recorder -f "$filename" -g "$(slurp)" > /dev/null &
fi
