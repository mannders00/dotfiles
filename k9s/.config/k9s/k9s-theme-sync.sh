#!/bin/bash

appearance=$(defaults read -g AppleInterfaceStyle 2>/dev/null)

if [[ "$appearance" = "Dark" ]]; then
    skin="onedark"
else
    skin="onelight"
fi

config_file="$HOME/dotfiles/k9s/.config/k9s/config.yaml"

if [[ -f "$config_file" ]]; then
    sed -i '' "s/skin: .*/skin: $skin/" "$config_file"
fi

exec k9s "$@"
