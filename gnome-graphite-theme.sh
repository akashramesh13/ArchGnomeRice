#!/bin/bash
# Get the default GNOME Terminal profile ID
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
# Base dconf path
BASE_KEY="/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID"
# Define pastel Nord-ish palette
PALETTE="'[
\"#1e1e2e\", \"#f38ba8\", \"#a6e3a1\", \"#f9e2af\",
\"#89b4fa\", \"#cba6f7\", \"#94e2d5\", \"#cdd6f4\",
\"#45475a\", \"#f38ba8\", \"#a6e3a1\", \"#f9e2af\",
\"#89b4fa\", \"#cba6f7\", \"#94e2d5\", \"#ffffff\"
]'"
# Apply the theme
dconf write $BASE_KEY/palette "$PALETTE"
dconf write $BASE_KEY/background-color "'#1e1e2e'"
dconf write $BASE_KEY/foreground-color "'#cdd6f4'"
dconf write $BASE_KEY/bold-color "'#cdd6f4'"
dconf write $BASE_KEY/bold-color-same-as-fg true
dconf write $BASE_KEY/use-theme-colors false
dconf write $BASE_KEY/cursor-colors-set true
dconf write $BASE_KEY/cursor-background-color "'#cba6f7'"
dconf write $BASE_KEY/cursor-foreground-color "'#1e1e2e'"
dconf write $BASE_KEY/highlight-colors-set true
dconf write $BASE_KEY/highlight-background-color "'#313244'"
dconf write $BASE_KEY/highlight-foreground-color "'#ffffff'"
echo "✅ Nord/Graphite inspired theme applied to GNOME Terminal profile: $PROFILE_ID"
