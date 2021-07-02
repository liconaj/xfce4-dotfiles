#!/bin/bash

SESSION=yes
XFWM4=yes
THUNAR=yes
FONTS=yes
PANEL=yes
NOTIFICATIONS=yes

KEYBINDINGS=no
BACKGROUNDS=no
LIGHTDM=no

if [ "$SESSION" == "yes" ]; then
    	echo "" && echo ""
	echo "SESSION OPTIONS"
    	echo ""

	echo "Show Hibernate option: false"
	xfconf-query -c xfce4-session -np /shutdown/ShowHibernate -t bool -s false
fi


if [ "$XFWM4" == "yes" ]; then
    	echo "" && echo ""
	echo "XFWM4"
 	echo ""

	echo "Button layout: O|HMC"
	xfconf-query -c xfwm4 -np /general/button_layout -t string -s "O|HMC"
	echo "Window placement ratio: center 100"
	xfconf-query -c xfwm4 -np /general/placement_ratio -t int -s "100"

fi


if [ "$NOTIFICATIONS" == "yes" ]; then
	echo "" && echo ""
	echo "NOTIFICATIONS"
    	echo ""
	echo "Theme: default"
	xfconf-query -c xfce4-notifyd -np /theme -t string -s "Default"
	echo "Position: bottom right"
	xfconf-query -c xfce4-notifyd -np /notify-location -t uint -s "3"
fi


if [ "$THUNAR" == "yes" ]; then
    	echo "" && echo ""
	echo "THUNAR"
    	echo ""

	echo "Location bar style: buttons"
	xfconf-query -c thunar -np /last-location-bar -t string -s "ThunarLocationButtons"
	echo "Sidebar icon size: 16px"
	xfconf-query -c thunar -np /shortcuts-icon-size -t string -s "THUNAR_ICON_SIZE_16"
fi


if [ "$FONTS" == "yes" ]; then
    	echo "" && echo ""
	echo "FONTS"
    	echo ""


	echo "Font: Noto Sans 10"
	xfconf-query -c xsettings -np /Gtk/FontName -t string -s "Noto Sans 10"

	echo "Title font: Noto Sans Bold 10"
	xfconf-query -c xfwm4 -np /general/title_font -t string -s "Noto Sans Bold 10"

	echo "Monospace font: Fantasque Sans Mono Regular 11"
	xfconf-query -c xsettings -np /Gtk/MonospaceFontName -t string -s "Fantasque Sans Mono Regular 11"

	echo "Font tweaks"
	echo "	Antialias: 1"
	echo "	Hinting: -1"
	echo "	HintStyle: hintfull"
	echo "	RGBA: rgb"
	xfconf-query -c xsettings -np /Xft/Antialias -t int -s "1"
	xfconf-query -c xsettings -np /Xft/Hinting -t int -s "-1"
	xfconf-query -c xsettings -np /Xft/HintStyle -t string -s "hintfull"
	xfconf-query -c xsettings -np /Xft/RGBA -t string -s "rgb"
fi


if [ "$PANEL" == "yes" ]; then
    	echo "" && echo ""
	echo "PANEL"
    	echo ""

	echo "Opening panel preferences..."
	echo "If you have a panel-2, you may want to deleted, then close the window"
	xfce4-panel --preferences

	echo "Dark mode: disabled"
	xfconf-query -c xfce4-panel -np /panels/dark-mode -t bool -s "false"

	echo "Icon size: 16px"
	xfconf-query -c xfce4-panel -np /panels/panel-1/icon-size -t uint -s "16"

	echo "Panel length: 100%"
	xfconf-query -c xfce4-panel -np /panels/panel-1/lenght -t uint -s "100"

	echo "Panel width: 36px"
	xfconf-query -c xfce4-panel -np /panels/panel-1/size -t uint -s "36"

	echo "Position:"
	echo "Panel unblocked, place it to them bottom and then press ENTER to continue"
	xfconf-query -c xfce4-panel -np /panels/panel-1/position-locked -t bool -s "false"
	read
	xfconf-query -c xfce4-panel -np /panels/panel-1/position-locked -t bool -s "true"
	echo "Panel blocked"


	echo "Setting panel plugins..."

	xfconf-query -c xfce4-panel -np /panels/panel-1/plugin-ids -t int -s 1 -t int -s 2 -t int -s 3 -t int -s 4 -t int -s 5 -t int -s 6 -t int -s 7 -t int -s 8 -t int -s 9

	echo "1 - Whisker menu"
	xfconf-query -c xfce4-panel -np /plugins/plugin-1 -t string -s "whiskermenu"

	echo "2 - Transparent separator"
	xfconf-query -c xfce4-panel -np /plugins/plugin-2 -t string -s "separator"
	xfconf-query -c xfce4-panel -np /plugins/plugin-2/expand -t bool -s "false"
	xfconf-query -c xfce4-panel -np /plugins/plugin-2/style -t uint -s "0"

	echo "3 - Docklike"
	xfconf-query -c xfce4-panel -np /plugins/plugin-3 -t string -s "docklike"

	echo "4 - Expanded transparent separator"
	xfconf-query -c xfce4-panel -np /plugins/plugin-4 -t string -s "separator"
	xfconf-query -c xfce4-panel -np /plugins/plugin-4/expand -t bool -s "true"
	xfconf-query -c xfce4-panel -np /plugins/plugin-4/style -t uint -s "0"

	echo "5 - Systray"
	xfconf-query -c xfce4-panel -np /plugins/plugin-5 -t string -s "systray"
	xfconf-query -c xfce4-panel -np /plugins/plugin-5/hiden-items -t string -s "vlc" -a
	xfconf-query -c xfce4-panel -np /plugins/plugin-5/square-icons -t bool -s "true"

	echo "6 - Power manager (battery icon)"
	xfconf-query -c xfce4-panel -np /plugins/plugin-6 -t string -s "power-manager-plugin"
	xfconf-query -c xfce4-power-manager -np /xfce4-power-manager/show-panel-label -t int -s "0"

	echo "7 - Pulseaudio tray applet"
	xfconf-query -c xfce4-panel -np /plugins/plugin-7 -t string -s "pulseaudio"

	echo "8 - Clock"
	xfconf-query -c xfce4-panel -np /plugins/plugin-8 -t string -s "clock"
	xfconf-query -c xfce4-panel -np /plugins/plugin-8/digital-format -t string -s "<small>%H:%M %p %n%d/%m/%Y</small>"

	echo "9 - Notifications"
	xfconf-query -c xfce4-panel -np /plugins/plugin-9 -t string -s "notification-plugin"

    	echo ""
	echo "Copying configuration files in $HOME/.config/xfce4 ..."
	cp -r src/config/xfce4/* ~/.config/xfce4

	xfce4-panel -r
fi


if [ "$KEYBINDINGS" == "yes" ]; then
	echo "" && echo ""
	echo "Keybindings"
	echo ""
	echo "This is the place to set you own keybindings"
	echo "Then, close the window in order to continue"
	xfwm4-settings
	xfce4-keyboard-settings
fi


if [ "$BACKGROUNDS" == "yes" ]; then
    	echo "" && echo ""
	if [ "$EUID" == "0" ]; then
		echo "Copying wallpapers in /usr/share/backgrounds..."
		cp -r -b src/backgrounds/* /usr/share/backgrounds
	else
		sudo cp -r src/backgrounds/* /usr/share/backgrounds && echo "Copying wallpapers in /usr/share/backgrounds..."
	fi
fi

if [ "$LIGHTDM" == "yes" ]; then
    	echo "" && echo ""
	if [ "$EUID" == "0" ]; then
		echo "Copying lightdm-gtk-greeter configuration to /etc/lightdm/lightdm-gtk-greeter.conf"
		cp -r -b src/config/lightdm/* /etc/lightdm/
	else
		echo "You need to be execute this as sudo in order to copy lightdm-gtk-greeter config"
		echo "Also keep in mind you need Lim-Blue theme installed in /usr/share/themes"
	fi
fi

echo ""
echo "Reloading desktop..."
xfdesktop -R
pkill xfwm4
#pkill xfsettingsd && xfsettingsd &
