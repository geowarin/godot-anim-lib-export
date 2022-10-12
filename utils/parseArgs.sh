function help() {
  echo "Usage:"
  printf '\t%s [character_file] [animations_dir] (output)' "$0"
  exit 1
}

if [ "$#" -lt 2 ]; then
  echo "Requires at least two arguments"
  help
fi
if [[ ! -r $1 ]]; then
  echo "[character_file] not readable"
  help
fi
if [[ ! -d $2 ]]; then
  echo "[animations_dir] is not a directory"
  help
fi
