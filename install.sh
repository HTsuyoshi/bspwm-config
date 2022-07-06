#!/bin/bash

stow config -t $HOME/.config/ -v
chmod 774 $HOME/.config/{sxhkd/sxhkdrc,bspwm/bspwmrc}
