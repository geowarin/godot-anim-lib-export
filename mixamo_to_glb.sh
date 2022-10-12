#!/usr/bin/env bash

#set -x

DIR=$(dirname "$0")

source "$DIR/utils/parseArgs.sh"

CHARACTER_FILE=${1}
ANIMATIONS_DIR=${2}

BASE_NAME=$(basename "$2")
OUTPUT_FILE=${3:-$BASE_NAME}

echo "Generating ${OUTPUT_FILE} with character ${CHARACTER_FILE} with animations from ${ANIMATIONS_DIR}"

export GDLIB_CHARACTER_FILE=$CHARACTER_FILE
export GDLIB_ANIMATIONS_DIR=$ANIMATIONS_DIR
export GDLIB_OUTPUT_FILE=$OUTPUT_FILE

blender --background -noaudio -P "$DIR/mixamo_to_glb.py"
