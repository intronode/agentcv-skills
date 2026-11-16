#!/bin/sh
# Check that this repo's skills/agentcv/SKILL.md is byte-identical to the file agentcv.ai serves.
set -eu
url="https://agentcv.ai/skills/agentcv/SKILL.md"
here="$(dirname "$0")/../skills/agentcv/SKILL.md"
served="$(mktemp)"
trap 'rm -f "$served"' EXIT
curl -fsSL "$url" -o "$served"
if cmp -s "$here" "$served"; then
  echo "in sync with $url"
else
  echo "OUT OF SYNC with $url" >&2
  exit 1
fi
