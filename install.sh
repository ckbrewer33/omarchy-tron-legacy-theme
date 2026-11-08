#!/bin/bash
# Install the Tron: Legacy theme (and optional GTK colors) for Omarchy.
# Run from the repository folder:  ./install.sh [--no-gtk]
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.config/omarchy/themes/tron-legacy"

mkdir -p "$DEST/backgrounds"
cp "$HERE"/{colors.toml,btop.theme,hyprland.lua,icons.theme,keyboard.rgb,preview.png} "$DEST/"
cp "$HERE"/backgrounds/* "$DEST/backgrounds/"
echo "Theme installed to $DEST"

if [[ ${1:-} != "--no-gtk" ]]; then
  mkdir -p "$HOME/.config/omarchy/themed" "$HOME/.config/omarchy/hooks/theme-set.d"
  cp "$HERE"/extras/gtk/gtk.css.tpl "$HERE"/extras/gtk/gtk3.css.tpl "$HOME/.config/omarchy/themed/"
  install -m 755 "$HERE/extras/gtk/20-gtk-colors" "$HOME/.config/omarchy/hooks/theme-set.d/20-gtk-colors"
  echo "GTK color templates and theme-switch hook installed"
fi

omarchy theme set tron-legacy
