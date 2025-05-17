#!/bin/bash

SCHEME_NAME="NeonBloom-Pink"
DEST_DIR="$HOME/.local/share/konsole"
SCHEME_FILE="$DEST_DIR/$SCHEME_NAME.colorscheme"

mkdir -p "$DEST_DIR"

cat > "$SCHEME_FILE" <<EOF
[General]
Description=$SCHEME_NAME
Opacity=1
Wallpaper=

[Background]
Color=0,0,0

[Foreground]
Color=217,31,100

[Color0]
Color=0,0,0

[Color1]
Color=217,31,100

[Color2]
Color=217,217,31

[Color3]
Color=255,209,102

[Color4]
Color=255,95,95

[Color5]
Color=237,31,190

[Color6]
Color=255,255,102

[Color7]
Color=245,245,245

[Color8]
Color=46,46,46

[Color9]
Color=255,70,140

[Color10]
Color=212,255,74

[Color11]
Color=255,224,102

[Color12]
Color=255,106,106

[Color13]
Color=255,102,217

[Color14]
Color=255,255,102

[Color15]
Color=255,255,255

[Cursor]
Color=217,31,100

[CursorText]
Color=0,0,0

[SelectionBackground]
Color=122,31,74

[SelectionForeground]
Color=0,0,0
EOF

echo "Color scheme '$SCHEME_NAME' installed to: $SCHEME_FILE"

if [[ "$1" == "--set-default" ]]; then
    CURRENT_PROFILE_PATH=$(grep -l "ColorScheme=" ~/.local/share/konsole/*.profile | head -n 1)
    if [[ -n "$CURRENT_PROFILE_PATH" ]]; then
        sed -i "s/^ColorScheme=.*/ColorScheme=$SCHEME_NAME/" "$CURRENT_PROFILE_PATH"
        echo "Set '$SCHEME_NAME' as the default color scheme in profile: $(basename "$CURRENT_PROFILE_PATH")"
    else
        echo "No Konsole profile found to set the default. You can set it manually in Konsole settings."
    fi
fi

