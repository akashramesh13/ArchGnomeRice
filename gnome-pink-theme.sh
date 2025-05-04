#!/bin/bash

# Get the default GNOME Terminal profile ID
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')

# Base dconf path
BASE_KEY="/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID"

# Define color palette
PALETTE="'[\"#000000\", \"#d219d9\", \"#d9d919\", \"#66d1ff\", \"#5f5fff\", \"#ed1fbd\", \"#66ffe6\", \"#f5f5f5\", \"#2e2e2e\", \"#ff49ff\", \"#49ff49\", \"#66e0ff\", \"#6a6aff\", \"#ff66ff\", \"#66fff3\", \"#ffffff\"]'"

# Apply settings
dconf write $BASE_KEY/palette "$PALETTE"
dconf write $BASE_KEY/background-color "'#000000'"
dconf write $BASE_KEY/bold-color-same-as-fg true
dconf write $BASE_KEY/cursor-colors-set true
dconf write $BASE_KEY/cursor-foreground-color "'#000000'"
dconf write $BASE_KEY/foreground-color "'#d91964'"
dconf write $BASE_KEY/bold-color "'#d91964'"
dconf write $BASE_KEY/cursor-background-color "'#d91964'"
dconf write $BASE_KEY/use-theme-colors false
dconf write $BASE_KEY/highlight-colors-set true
dconf write $BASE_KEY/highlight-background-color "'#7a1f7a'"
dconf write $BASE_KEY/highlight-foreground-color "'#000000'"

echo "✅ Theme applied to GNOME Terminal profile: $PROFILE_ID"
