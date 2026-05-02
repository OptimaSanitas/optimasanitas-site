#!/usr/bin/env bash
# Stage static assets (no .git) and add to local Kubo. Requires: ipfs in PATH, ~/.ipfs initialized.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
STAGE="${STAGE:-/tmp/optimasanitas-ipfs-stage}"

rm -rf "$STAGE"
mkdir -p "$STAGE/calc" "$STAGE/sanitas-seeker"
cp "$ROOT/index.html" "$STAGE/"
cp "$ROOT/calc"/*.html "$STAGE/calc/"
cp "$ROOT/sanitas-seeker"/*.html "$STAGE/sanitas-seeker/"

echo "Staged: $STAGE"
echo "Adding to IPFS (CIDv1)..."
CID="$(ipfs add -r -Q --cid-version=1 "$STAGE")"
echo "Root CID: $CID"
ipfs pin add "$CID" >/dev/null
echo "Pinned locally."
echo ""
echo "Public gateways (after your blocks reach the network / remote pins):"
echo "  https://ipfs.io/ipfs/${CID}/"
echo "  https://dweb.link/ipfs/${CID}/"
echo ""
echo "sns.id → Other records → IPFS:"
echo "  ipfs://${CID}"
echo ""
echo "If this machine should serve the network, run: ipfs daemon"
