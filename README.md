# license-check

Fails the job when the repository's `LICENSE` isn't on an allowed list.

```yaml
- uses: actions/checkout@v6
- uses: nodeselector/license-check@v1
  with:
    allowed: MIT,Apache-2.0   # optional; defaults to the shared policy
```

The shared default policy is loaded at runtime from
https://nodeselector.github.io/license-check/helper.sh (this repository's
`gh-pages` branch).

Built for a GitHub Actions lockfile and egress firewall demo.
