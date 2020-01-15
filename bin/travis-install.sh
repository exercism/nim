#!/bin/sh

# Travis CI uses this script to install Nim from the pre-built binaries.

set -eux

cd -- "$(dirname -- "$0")" # Change directory to that of this script.

# Download the stable release archive that contains pre-built binaries.
NIM_URL="https://nim-lang.org/download/nim-${NIM_VERSION}-linux_x64.tar.xz"
NIM_DIR="nim-${NIM_VERSION}"
NIM_TAR="${NIM_DIR}.tar.xz"
curl -sSfL --retry 3 --retry-connrefused "${NIM_URL}" -o "${NIM_TAR}"

# Extract the archive.
tar -xf "${NIM_TAR}"
