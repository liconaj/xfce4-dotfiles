#!/bin/bash

if [ "$EUID" == "0" ]; then
	THEMES_DIR="/usr/share/themes"
	ICONS_DIR="/usr/share/icons"
else
	THEMES_DIR="$HOME/.local/share/themes"
	ICONS_DIR="$HOME/.local/share/icons"
fi

if [ ! -d Resources ]; then
	mkdir Resources
fi

cd Resources

[ ! -d $THEMES_DIR ] && mkdir -p $THEMES_DIR
[ ! -d $ICONS_DIR ] && mkdir -p $ICONS_DIR


# Lim Blue
echo ""
echo "Installing Lim Blue Theme"

if [ ! -d Lim-Blue ]; then
	git clone https://github.com/liconaj/Lim-Blue
fi
cp -r Lim-Blue/Lim-* $THEMES_DIR


if [[ ! -d $ICONS_DIR/Papirus && ! -d $ICONS_DIR/Papirus-Light && ! -d $ICONS_DIR/Papirus-Dark ]]; then
	# Papirus Icon theme
	echo ""
	echo "Installing Papirus Icon theme..."

	if [ ! -d $ICONS_DIR/Papirus ]; then
		wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR=$ICONS_DIR sh
	fi

fi

cd ..
echo "Installing Papirus-folders script..."
wget -qO- https://git.io/papirus-folders-install | sh

echo "Patching icon theme"
source patch_icons.sh

echo ""
echo "Changing the color of the folders to cyan..."
papirus-folders -C cyan -t Papirus
papirus-folders -C cyan -t Papirus-Light
papirus-folders -C cyan -t Papirus-Dark

echo ""
echo "OK"
