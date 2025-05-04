#!/bin/bash

# Get the default GNOME Terminal profile ID
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
BASE_KEY="/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID"

# Graphite-inspired color palette (from your CSS)
PALETTE="'[
\"#181825\", \"#f38ba8\", \"#a6e3a1\", \"#f9e2af\",
\"#89b4fa\", \"#cba6f7\", \"#94e2d5\", \"#cdd6f4\",
\"#585b70\", \"#f38ba8\", \"#a6e3a1\", \"#f9e2af\",
\"#89b4fa\", \"#cba6f7\", \"#94e2d5\", \"#ffffff\"
]'"

# Apply the theme to the current profile
dconf write $BASE_KEY/palette "$PALETTE"
dconf write $BASE_KEY/background-color "'#181825'"
dconf write $BASE_KEY/foreground-color "'#cdd6f4'"
dconf write $BASE_KEY/bold-color "'#cdd6f4'"
dconf write $BASE_KEY/bold-color-same-as-fg true
dconf write $BASE_KEY/use-theme-colors false
dconf write $BASE_KEY/cursor-colors-set true
dconf write $BASE_KEY/cursor-background-color "'#cba6f7'"
dconf write $BASE_KEY/cursor-foreground-color "'#181825'"
dconf write $BASE_KEY/highlight-colors-set true
dconf write $BASE_KEY/highlight-background-color "'#313244'"
dconf write $BASE_KEY/highlight-foreground-color "'#ffffff'"

echo "✅ Graphite-inspired GNOME Terminal theme applied to profile: $PROFILE_ID"

