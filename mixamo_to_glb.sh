#!/usr/bin/env bash

set -x

DIR=$(dirname "$0")
blender --background -noaudio -P "$DIR/mixamo_to_glb.py"
