#!/bin/sh

# Travis CI uses this script to install Nim from the pre-built binaries.

set -eux

BIN_DIR="${TRAVIS_BUILD_DIR}/bin"

# Download the stable release archive that contains pre-built binaries.
NIM_URL="https://nim-lang.org/download/nim-${NIM_VERSION}-linux_x64.tar.xz"
NIM_EXTRACT_DIR="${BIN_DIR}/nim-${NIM_VERSION}"
NIM_TAR="${NIM_EXTRACT_DIR}.tar.xz"
curl -sSfL --retry 3 --retry-connrefused "${NIM_URL}" -o "${NIM_TAR}"

# Extract the archive.
tar -C "${BIN_DIR}" -xf "${NIM_TAR}"
