#!/bin/bash

# Colors
TEAL="#94e2d5"
FG='\033[38;2;148;226;213m'
RESET='\033[0m'

# Clear screen
clear

# Centering function
center() {
    local term_width=$(tput cols)
    local text="$1"
    local clean_text=$(echo -e "$text" | sed 's/\x1B\[[0-9;]*[a-zA-Z]//g')  # Strip ANSI
    local padding=$(( (term_width - ${#clean_text}) / 2 ))
    printf "%*s" "$padding" ""
    echo -e "$text"
}
# Header
echo
center "${FG}🔥 Welcome to My Riced Setup 🔥${RESET}"
center "${FG}────────────────────────────────────────────${RESET}"
echo

# Fetch tool
# if command -v fastfetch &> /dev/null; then
#     fastfetch
if command -v neofetch &> /dev/null; then
    neofetch
else
    echo "No fetch tool installed."
fi

# Optional terminal preview
# if [[ $XDG_CURRENT_DESKTOP == *"GNOME"* ]]; then
#     gnome-terminal -- bash -c "echo -e '${FG}This is my blurred terminal ✨'; exec bash"
# fi
# Closing line
center "🌈 Ricing is an art..." | pv -qL 10 | lolcat
echo
center "${FG}✨ Stay Graphite, Stay Teal ✨${RESET}"
echo

