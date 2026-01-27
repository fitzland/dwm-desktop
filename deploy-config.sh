#!/usr/bin/env bash

set -euo pipefail

# -e = exit on error
# -u = treat unset variables as error
# -o pipefail = fail if any command in a pipeline fails

SOURCE_DIR="$(pwd)/suckless"
TARGET_DIR="$HOME/.config/suckless"

mkdir -p "$TARGET_DIR"

# -a = archive (recursive, preserve perms/timestamps/owner/group/symlinks)
# -v = verbose
# -h = human-readable sizes
# --progress = show transfer progress
# --delete = remove files in target that no longer exist in source (keeps target clean)
# --dry-run = test first (uncomment to preview)

rsync -avh --progress --delete --dry-run \
#rsync -avh --progress --delete \
  --exclude '.gitignore' \
  "$SOURCE_DIR/sxhkd/"     "$TARGET_DIR/sxhkd/" \
  "$SOURCE_DIR/dunst/"     "$TARGET_DIR/dunst/" \
  "$SOURCE_DIR/picom/"     "$TARGET_DIR/picom/" \
  "$SOURCE_DIR/rofi/"      "$TARGET_DIR/rofi/" \
  "$SOURCE_DIR/scripts/"   "$TARGET_DIR/scripts/" \
  "$SOURCE_DIR/wallpaper/" "$TARGET_DIR/wallpaper/"

# Optional: exclude any accidental .git or temp files if they creep in
# --exclude='.git/' --exclude='*.swp' --exclude='*~'

echo "Deployment complete to $TARGET_DIR"