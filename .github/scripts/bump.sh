#!/usr/bin/env bash
# Point the cask at Ombro's latest release: its version, and the .dmg's checksum from the
# release's SHA256SUMS. Prints the version; changes nothing if the cask is already there.
set -euo pipefail
cask=Casks/ombro.rb
tag=$(gh release view --repo mrkrsl/ombro --json tagName --jq .tagName) # the latest, not a pre-release
version=${tag#v}
sum=$(gh release download "$tag" --repo mrkrsl/ombro --pattern SHA256SUMS --output - |
  awk -v f="Ombro_${version}_arm64.dmg" '$2 == f {print $1}')
[[ $sum =~ ^[0-9a-f]{64}$ ]] || { echo "No checksum for Ombro_${version}_arm64.dmg in $tag" >&2; exit 1; }
sed -i.bak -E "s/^  version \".*\"/  version \"$version\"/; s/^  sha256 \".*\"/  sha256 \"$sum\"/" "$cask"
rm -f "$cask.bak"
echo "$version"
