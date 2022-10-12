#!/usr/bin/env bash

#set -x

DIR=$(dirname "$0")

rm -rf "$DIR/gd-proj-template/.godot"
godot-master-mono --path "$DIR/gd-proj-template" -e --headless --quit

shopt -s globstar nullglob
mv "$DIR/gd-proj-template/.godot/imported/"*.res "$1"
