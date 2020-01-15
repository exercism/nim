#!/bin/sh
#
# This script installs the Nim version given by the `NIM_VERSION` environment variable
# into a directory named `nim-${NIM_VERSION}` in the same directory as this script.

set -eux

rebuild() {
  bin/nim c --skipUserCfg --skipParentCfg koch.nim
  ./koch boot -d:release
  ./koch nimble
}

readonly NIM_DIR="nim-${NIM_VERSION}"

cd -- "$(dirname -- "$0")" # Change directory to that of this script.

git clone -b "v${NIM_VERSION}" --depth 1 https://github.com/nim-lang/Nim.git "${NIM_DIR}"
(
  cd "${NIM_DIR}"
  git clone --depth 1 https://github.com/nim-lang/csources.git
  (
    cd csources
    sh build.sh
  )
  rm -rf csources
  rebuild
)
