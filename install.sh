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

[ -z $1 ] && usage && exit

case $1 in
	'light')
		echo 'setting light theme'
		[[ -f /usr/share/fonts/TTF/opus-icon.ttf ]] || doas cp ./font/opus-icon.ttf /usr/share/fonts/TTF/;;
	'mirage')
		echo "$SETTING_UP";;
	*) usage && exit
esac

SETTING_UP="setting $1 theme"

echo 'removing old theme'
remove

[[ $1 == 'light' ]] && stow config -t $HOME/.config/ -v || stow "$1-config" -t $HOME/.config/ -v
stow base -t $HOME/.config/ -v

chmod 774 $HOME/.config/{sxhkd/sxhkdrc,bspwm/bspwmrc}
