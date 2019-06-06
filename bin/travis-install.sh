#!/bin/sh

# Travis CI uses this script to install Nim from the pre-built binaries.

set -eux

NIM_URL="https://nim-lang.org/download/nim-${NIM_VERSION}-linux_x64.tar.xz"
NIM_TAR="nim-${NIM_VERSION}.tar.xz"

cd "${TRAVIS_BUILD_DIR}/bin"
curl -sSf "${NIM_URL}" > "${NIM_TAR}"
tar xf "${NIM_TAR}"
