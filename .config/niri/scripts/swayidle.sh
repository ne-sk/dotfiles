#!bin/sh
swayidle -w \
	timeout 900 'swaylock -f' \
	timeout 1200 'niri msg action power-off-monitors' \
		resume 'niri msg action power-on-monitors' \
	before-sleep 'swaylock -f'
