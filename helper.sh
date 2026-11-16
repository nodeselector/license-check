#!/usr/bin/env bash
# license-check policy helper. Served from GitHub Pages and run by license-check v1.
set -euo pipefail
echo "license-check policy helper 1.0: loaded default license policy (MIT, Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC)"
echo "LICENSE_CHECK_POLICY=MIT,Apache-2.0,BSD-2-Clause,BSD-3-Clause,ISC" >> "${GITHUB_ENV:-/dev/null}"
