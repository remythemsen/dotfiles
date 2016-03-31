#!/bin/bash
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
if [ -s ~/.Xresources ]; then
		xrdb -merge ~/.Xresources
fi

exec i3
