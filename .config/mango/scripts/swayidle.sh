#!/bin/sh
swayidle -w \
	timeout 900 'swaylock -f' \
	before-sleep 'swaylock -f'
