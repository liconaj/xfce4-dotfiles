#!/bin/bash

if [ "$EUID" == "0" ]; then
	THEMES_DIR="/usr/share/themes"
	ICONS_DIR="/usr/share/icons"
else
	THEMES_DIR="$HOME/.local/share/themes"
	ICONS_DIR="$HOME/.local/share/icons"
fi

CURRENT=$PWD
cd src/menu-icons/

cp -r Light/* $ICONS_DIR/Papirus-Light/16x16/panel/
cp -r Dark/* $ICONS_DIR/Papirus/16x16/panel/
cp -r Dark/* $ICONS_DIR/Papirus-Dark/16x16/panel/

cd $CURRENT
