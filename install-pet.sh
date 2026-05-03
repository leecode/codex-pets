#!/usr/bin/env bash
set -euo pipefail

DIST_DIR="$(cd "$(dirname "$0")" && pwd)/dist"
PETS_DIR="$HOME/.codex/pets"

list_pets() {
  echo "Available pets:"
  for dir in "$DIST_DIR"/*/; do
    if [ -f "$dir/pet.json" ]; then
      id=$(basename "$dir")
      name=$(grep -o '"displayName"[[:space:]]*:[[:space:]]*"[^"]*"' "$dir/pet.json" | sed 's/.*: *"//;s/"//')
      printf "  %-15s %s\n" "$id" "$name"
    fi
  done
}

if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo "Usage: $0 <pet-id> [pet-id ...]"
  echo "       $0 --list"
  echo ""
  list_pets
  exit 0
fi

if [ "$1" = "--list" ] || [ "$1" = "-l" ]; then
  list_pets
  exit 0
fi

installed=0
failed=0

for pet_id in "$@"; do
  src="$DIST_DIR/$pet_id"

  if [ ! -d "$src" ]; then
    echo "Error: pet '$pet_id' not found in dist/"
    failed=$((failed + 1))
    continue
  fi

  if [ ! -f "$src/pet.json" ]; then
    echo "Error: '$pet_id' is missing pet.json"
    failed=$((failed + 1))
    continue
  fi

  if [ ! -f "$src/spritesheet.webp" ]; then
    echo "Error: '$pet_id' is missing spritesheet.webp"
    failed=$((failed + 1))
    continue
  fi

  dest="$PETS_DIR/$pet_id"
  mkdir -p "$dest"
  cp "$src/pet.json" "$src/spritesheet.webp" "$dest/"
  echo "Installed '$pet_id' -> $dest"
  installed=$((installed + 1))
done

echo ""
echo "Done: $installed installed, $failed failed"

if [ $installed -gt 0 ]; then
  echo "Tip: If the UI doesn't refresh, switch to another pet and back."
fi

exit $failed
