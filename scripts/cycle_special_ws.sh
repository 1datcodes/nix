#!/usr/bin/env bash

special_ws=("music" "comms" "scratchpad" "hidden")

runtime="${XDG_RUNTIME_DIR:-$HOME/.cache}"
mkdir -p "$runtime"
statefile="$runtime/hypr-special-cycle.state"

if [[ -f "$statefile" ]]; then
  last_index=$(<"$statefile")
else
  echo "File not found"
  last_index=-1
fi

next_index=$(((last_index + 1) % ${#special_ws[@]}))

echo "$next_index" >"$statefile"

echo "next_index: $next_index"

hyprctl dispatch togglespecialworkspace "${special_ws[$next_index]}"
