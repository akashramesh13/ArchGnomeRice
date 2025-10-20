#!/bin/bash

PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
BASE_KEY="/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID"

# Disable theme colors so our custom colors apply
dconf write $BASE_KEY/use-theme-colors false

# Set main colors
dconf write $BASE_KEY/background-color "'#24273a'"
dconf write $BASE_KEY/foreground-color "'#cad3f5'"
dconf write $BASE_KEY/cursor-background-color "'#f5a97f'"
dconf write $BASE_KEY/cursor-foreground-color "'#24273a'"

# Set palette with Catppuccin colors
dconf write $BASE_KEY/palette "['#24273a', '#f38ba8', '#a6d189', '#f5a97f', '#89b4fa', '#f5bde6', '#94e2d5', '#cad3f5', '#6c7086', '#f38ba8', '#a6d189', '#f5a97f', '#89b4fa', '#f5bde6', '#94e2d5', '#cad3f5']"

