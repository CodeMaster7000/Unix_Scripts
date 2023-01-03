#!/usr/bin/env bash
days="$1"
if [ -z "$days" ]; then
  days=3
fi
find ~/.cache -depth -type f -mtime +"$days" -delete
