#!/usr/bin/env bash

DIR=$(dirname "$0")

source "$DIR/utils/parseArgs.sh"

CHARACTER_FILE=${1}
ANIMATIONS_DIR=${2}

BASE_NAME=$(basename "$2")
OUTPUT_FILE=${3:-$BASE_NAME}

"$DIR/mixamo_to_glb.sh" "$CHARACTER_FILE" "$ANIMATIONS_DIR" "$DIR/gd-proj-template/anims.glb"

"$DIR/gd_gltf_to_res.sh" "$OUTPUT_FILE"
