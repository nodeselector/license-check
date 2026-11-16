#!/usr/bin/env bash
# Detects the SPDX id of the LICENSE file in $INPUT_PATH and fails unless it's
# allowed. The default policy comes from helper.sh (LICENSE_CHECK_POLICY).
set -euo pipefail

dir=${INPUT_PATH:-.}
allowed=${INPUT_ALLOWED:-${LICENSE_CHECK_POLICY:-MIT,Apache-2.0,BSD-2-Clause,BSD-3-Clause,ISC}}

file=''
for f in LICENSE LICENSE.md LICENSE.txt COPYING; do
  [ -f "$dir/$f" ] && { file="$dir/$f"; break; }
done
if [ -z "$file" ]; then
  echo "license-check: no LICENSE file in $dir, nothing to check"
  exit 0
fi

text=$(tr -s '[:space:]' ' ' <"$file")
case "$text" in
  *"MIT License"* | *"Permission is hereby granted, free of charge"*) id=MIT ;;
  *"Apache License"*"Version 2.0"*) id=Apache-2.0 ;;
  *"GNU AFFERO GENERAL PUBLIC LICENSE"*) id=AGPL-3.0 ;;
  *"GNU GENERAL PUBLIC LICENSE"*"Version 3"*) id=GPL-3.0 ;;
  *"GNU GENERAL PUBLIC LICENSE"*"Version 2"*) id=GPL-2.0 ;;
  *"Redistribution and use in source and binary forms"*"Neither the name"*) id=BSD-3-Clause ;;
  *"Redistribution and use in source and binary forms"*) id=BSD-2-Clause ;;
  *"Permission to use, copy, modify, and/or distribute this software"*) id=ISC ;;
  *) id=unknown ;;
esac

if [[ ",${allowed// /}," == *",$id,"* ]]; then
  echo "license-check: $file is $id (allowed)"
else
  echo "::error file=$file::license-check: $file is $id, allowed: $allowed"
  exit 1
fi
