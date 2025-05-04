#!/bin/bash
# Get the default GNOME Terminal profile ID
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
# Base dconf path
BASE_KEY="/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID"

# Define teal & pink/purple theme palette based on the CSS
# Colors extracted directly from the CSS file with pink accents included
PALETTE="'[
\"#292e38\", \"#f44336\", \"#63a6a5\", \"#c4dedd\", 
\"#2196F3\", \"#cba6f7\", \"#a4cbca\", \"#f9fafb\",
\"#546e7a\", \"#e57373\", \"#63a6a5\", \"#c4dedd\", 
\"#2196F3\", \"#7e57c2\", \"#63a6a5\", \"#ffffff\"
]'"

# Dark variant - matching shell theme
dconf write $BASE_KEY/palette "$PALETTE"
dconf write $BASE_KEY/background-color "'#292e38'"
dconf write $BASE_KEY/foreground-color "'#f9fafb'"
dconf write $BASE_KEY/bold-color "'#ffffff'"
dconf write $BASE_KEY/bold-color-same-as-fg false
dconf write $BASE_KEY/use-theme-colors false
dconf write $BASE_KEY/cursor-colors-set true
dconf write $BASE_KEY/cursor-background-color "'#cba6f7'"  # Using the purple accent for cursor
dconf write $BASE_KEY/cursor-foreground-color "'#292e38'"
dconf write $BASE_KEY/highlight-colors-set true
dconf write $BASE_KEY/highlight-background-color "'#63a6a5'"  # Teal accent for highlight
dconf write $BASE_KEY/highlight-foreground-color "'#ffffff'"
echo "✅ Teal & Purple theme applied to GNOME Terminal profile: $PROFILE_ID"

# Light variant - uncomment these lines if you want a light theme
# dconf write $BASE_KEY/background-color "'#f9fafb'"
# dconf write $BASE_KEY/foreground-color "'#292e38'"
# dconf write $BASE_KEY/bold-color "'#000000'"
# dconf write $BASE_KEY/bold-color-same-as-fg false
# dconf write $BASE_KEY/cursor-background-color "'#cba6f7'"  # Purple accent for cursor
# dconf write $BASE_KEY/cursor-foreground-color "'#ffffff'"
# dconf write $BASE_KEY/highlight-background-color "'#c4dedd'"
# dconf write $BASE_KEY/highlight-foreground-color "'#292e38'"
# echo "✅ Teal & Purple theme (light) applied to GNOME Terminal profile: $PROFILE_ID"
