#!/usr/bin/env bash
# Soundness probe: take the corpus cases the checker ACCEPTS, emit them to Go, and run
# each under the race detector. Accept-but-race is the P0 BOUNTY.md describes, and the
# upstream differential loop builds and runs accept-side programs without -race.
#
# Usage: race-scan.sh /path/to/hyb [CORPUS_DIR]
set -u
HYB="$1"
CORPUS="${2:-tests/checker-corpus}"
WORK=/tmp/racework
rm -rf "$WORK"
mkdir -p "$WORK"

race=0
ok=0
buildfail=0
skipped=0

for f in "$CORPUS"/*.hy; do
  base=$(basename "$f" .hy)
  # only cases the checker accepts, and only runnable programs
  grep -q 'EXPECTED-VERDICT: ACCEPT' "$f" || continue
  grep -q 'fn main' "$f" || { skipped=$((skipped + 1)); continue; }

  d="$WORK/$base"
  mkdir -p "$d"
  if ! "$HYB" build "$f" -o "$d" --emit-go >"$d/emit.log" 2>&1; then
    buildfail=$((buildfail + 1))
    echo "  $base EMIT-FAIL"
    continue
  fi
  ( cd "$d" && go mod init p >/dev/null 2>&1 && go build -race -o prog . ) >"$d/gobuild.log" 2>&1
  if [ ! -x "$d/prog" ]; then
    buildfail=$((buildfail + 1))
    echo "  $base GO-BUILD-FAIL $(tail -1 "$d/gobuild.log" | cut -c1-60)"
    continue
  fi
  out=$( cd "$d" && GORACE="halt_on_error=1" timeout 20 ./prog 2>&1 )
  if printf '%s' "$out" | grep -q 'DATA RACE'; then
    race=$((race + 1))
    echo "  $base *** DATA RACE ***"
    printf '%s\n' "$out" | grep -A3 'DATA RACE' | head -12 | sed 's/^/      /'
  else
    ok=$((ok + 1))
    echo "  $base clean"
  fi
done

echo "== race-scan summary: races=$race clean=$ok build-fail=$buildfail skipped=$skipped"
