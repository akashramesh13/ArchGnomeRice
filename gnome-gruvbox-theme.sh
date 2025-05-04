#!/bin/bash

# Get the default GNOME Terminal profile ID
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')

# Base dconf path
BASE_KEY="/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID"

# Gruvbox dark palette
PALETTE="'[\"#282828\", \"#cc241d\", \"#98971a\", \"#d79921\", \"#458588\", \"#b16286\", \"#689d6a\", \"#a89984\", \"#928374\", \"#fb4934\", \"#b8bb26\", \"#fabd2f\", \"#83a598\", \"#d3869b\", \"#8ec07c\", \"#ebdbb2\"]'"

# Apply Gruvbox Dark settings
dconf write $BASE_KEY/palette "$PALETTE"
dconf write $BASE_KEY/background-color "'#282828'"
dconf write $BASE_KEY/foreground-color "'#ebdbb2'"
dconf write $BASE_KEY/bold-color "'#ebdbb2'"
dconf write $BASE_KEY/bold-color-same-as-fg true
dconf write $BASE_KEY/use-theme-colors false
dconf write $BASE_KEY/cursor-colors-set true
dconf write $BASE_KEY/cursor-background-color "'#ebdbb2'"
dconf write $BASE_KEY/cursor-foreground-color "'#282828'"
dconf write $BASE_KEY/highlight-colors-set true
dconf write $BASE_KEY/highlight-background-color "'#3c3836'"
dconf write $BASE_KEY/highlight-foreground-color "'#ebdbb2'"

echo "✅ Gruvbox Dark theme applied to GNOME Terminal profile: $PROFILE_ID"

