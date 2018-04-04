#! /usr/bin

find . -type d -empty -and -not  -regex "./.git.*" -exec touch {}/.gitkeep \;

