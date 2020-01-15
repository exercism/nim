#!/bin/sh
#
# This script installs the latest stable Nim version into a directory named `nim-stable`
# in the same directory as this script.

set -eux

rebuild() {
  bin/nim c --skipUserCfg --skipParentCfg koch.nim
  ./koch boot -d:release
  ./koch nimble
}

readonly NIM_VERSION="v$(curl -sSfL --retry 3 https://nim-lang.org/channels/stable)"
readonly NIM_DIR="nim-stable"

cd -- "$(dirname -- "$0")" # Change directory to that of this script.

git clone -b "${NIM_VERSION}" --depth 1 https://github.com/nim-lang/Nim.git "${NIM_DIR}"
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
