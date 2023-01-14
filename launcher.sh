#!/bin/sh

# Change these directories to where you installed Heroic and KH1.5+2.5
INSTALL_DIR="/home/deck/Games/Heroic/KH_1.5_2.5/"
HEROIC_CONFIG_DIR="/home/deck/.var/app/com.heroicgameslauncher.hgl/config/heroic/GamesConfig/"

# Script
title=$(zenity --list \
               --width=400 \
               --height=250 \
               --title="KH1.5+2.5 Game Selection" \
               --column="Title" \
               "Kingdom Hearts Final Mix" \
               "Kingdom Hearts Re:Chain of Memories" \
               "Kingdom Hearts II Final Mix" \
               "Kingdom Hearts Birth by Sleep Final Mix")

exe=""
case $title in
    "Kingdom Hearts Final Mix")
    exe="KINGDOM HEARTS FINAL MIX.exe"
    ;;

    "Kingdom Hearts Re:Chain of Memories")
    exe="KINGDOM HEARTS Re_Chain of Memories.exe"
    ;;

    "Kingdom Hearts II Final Mix")
    exe="KINGDOM HEARTS II FINAL MIX.exe"
    ;;

    "Kingdom Hearts Birth by Sleep Final Mix")
    exe="KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
    ;;
esac

if [ -z "$exe" ]; then
    exit 1;
fi

json_path=$HEROIC_CONFIG_DIR"68c214c58f694ae88c2dab6f209b43e4.json"

tmp=$(mktemp)
jq --arg exe "$INSTALL_DIR$exe" '."68c214c58f694ae88c2dab6f209b43e4".targetExe = $exe' "$json_path" > "$tmp" && mv "$tmp" "$json_path"

flatpak run com.heroicgameslauncher.hgl --no-gui --no-sandbox "heroic://launch/68c214c58f694ae88c2dab6f209b43e4"
