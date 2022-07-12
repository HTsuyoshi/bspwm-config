#!/bin/bash

function usage {
	echo 'usage:'
	echo '    ./install.sh theme'
	echo 'thmes:'
	echo '    ayu light/ayu mirage (light)'
	echo '    ayu dark (dark)'
	echo '    ayu mirage (mirage)'
}

function remove {
	rm -r $HOME/.config/{alacritty,bspwm,polybar,sxhkd}
}

SETTING_UP="setting $1 theme"
REMOVING="removing old theme"

[ -z $1 ] && usage && exit

case $1 in
	'light')
		echo "$REMOVING"
		remove
		echo 'setting light theme'
		stow base -t $HOME/.config/ -v
		stow config -t $HOME/.config/ -v;;
	'dark')
		echo "$REMOVING"
		remove
		echo "$SETTING_UP"
		stow base -t $HOME/.config/ -v
		stow "$1-config" -t $HOME/.config/ -v;;
	'mirage')
		echo "$REMOVING"
		remove
		echo "$SETTING_UP"
		stow base -t $HOME/.config/ -v
		stow "$1-config" -t $HOME/.config/ -v;;
	*) usage && exit
esac

chmod 774 $HOME/.config/{sxhkd/sxhkdrc,bspwm/bspwmrc}
