#!/usr/bin/env bash

set -x

DIR=$(dirname "$0")

rm -rf gd-proj-template/.godot
godot-master-mono --path gd-proj-template -e --headless --quit
mv gd-proj-template/.godot/imported/*.res "$1"
