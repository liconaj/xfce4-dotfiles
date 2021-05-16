#!/bin/bash


# Options: win, grid
MENU_ICON=grid

#Options: light, dark
THEME=light

echo "#####################"
echo "# INSTALLING THEMES #"
echo "#####################"

#source install-themes.sh

echo " "
echo "#####################"
echo "#   SETTING XFCE4   #"
echo "#####################"
echo ""

source configure-xfce4.sh

echo ""
echo "#####################"
echo "#     VARIABLES     #"
echo "#####################"
echo ""

source variables.sh

export PATH=$PATH:$HOME/.local/bin

settheme $THEME &
menu-icon $MENU_ICON

echo ""
echo "Done"
echo "You may have to restart to see all the changes..."
echo "Use `settheme` and `menu-icon` in order to change appareance easily"
$echo "Enjoy"
