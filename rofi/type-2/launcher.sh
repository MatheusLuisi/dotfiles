#!/bin/bash

dir="$HOME/.config/rofi/type-2"
theme='style'

## Run
pkill rofi || rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi

# chmod +x this file 