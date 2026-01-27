#!/usr/bin/env bash

set -euo pipefail

SOURCE_DIR="$(pwd)/suckless"
TARGET_DIR="$HOME/.config/suckless"

mkdir -p "$TARGET_DIR"

# Ensure target subdirectories exist
for sub in sxhkd dunst picom rofi scripts wallpaper; do
    mkdir -p "$TARGET_DIR/$sub"
done

echo "Debug: SOURCE_DIR = $SOURCE_DIR"
echo "Debug: TARGET_DIR = $TARGET_DIR"

rsync -avh --progress --delete --exclude '.gitignore' "$SOURCE_DIR/sxhkd/"     "$TARGET_DIR/sxhkd/"
rsync -avh --progress --delete --exclude '.gitignore' "$SOURCE_DIR/dunst/"     "$TARGET_DIR/dunst/"
rsync -avh --progress --delete --exclude '.gitignore' "$SOURCE_DIR/picom/"     "$TARGET_DIR/picom/"
rsync -avh --progress --delete --exclude '.gitignore' "$SOURCE_DIR/rofi/"      "$TARGET_DIR/rofi/"
rsync -avh --progress --delete --exclude '.gitignore' "$SOURCE_DIR/scripts/"   "$TARGET_DIR/scripts/"
rsync -avh --progress --delete --exclude '.gitignore' "$SOURCE_DIR/wallpaper/" "$TARGET_DIR/wallpaper/"

echo "Deployment complete to $TARGET_DIR"