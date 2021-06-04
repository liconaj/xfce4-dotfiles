#!/bin/sh

[[ ! -d Resources/Lim-Blue ]] && bash install-themes.sh

sudo cp -r Resources/Lim-Blue/Lim-* /usr/share/themes/
sudo cp -r src/config/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

