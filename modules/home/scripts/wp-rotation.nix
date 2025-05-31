{pkgs}:
pkgs.writeShellScriptBin "wp-rotation" ''
  #!/usr/bin/env bash

  WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
  INTERVAL=300  # Alle 5 Minuten

  if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 1
  fi

  while true; do
    FILE=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)
    swww img "$FILE" --transition-type any --transition-duration 2
    sleep "$INTERVAL"
  done
''
