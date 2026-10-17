#!/usr/bin/env bash
# Run one fixture set through one hyb binary and summarise.
# Usage: battery.sh /path/to/hyb TAG [FIXTURE_DIR]
set -u
HYB="$1"
TAG="$2"
DIR="${3:-ci/fixtures/425}"

acc=0
rej=0
echo "== battery ${TAG} (${DIR}) =="
for f in "${DIR}"/*.hy; do
  out=$("$HYB" check "$f" 2>&1)
  rc=$?
  base=$(basename "$f")
  if [ $rc -eq 0 ]; then
    acc=$((acc + 1))
    verdict=ACCEPT
  else
    rej=$((rej + 1))
    verdict=REJECT
  fi
  first=$(printf '%s' "$out" | head -1 | cut -c1-78)
  printf '  %-8s %-6s %s\n' "$base" "$verdict" "$first"
done
echo "  summary ${TAG}: accepted=${acc} rejected=${rej}"
