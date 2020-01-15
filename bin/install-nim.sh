#!/bin/sh
#
# This script installs Nim to the directory named `nim-${CHANNEL}` in the same
# directory as this script.
#
# The environment variable `CHANNEL` determines the Nim version as follows:
# - If `CHANNEL` is `stable`: install from the latest Nim tag.
# - Otherwise, install from the latest commit on the branch named `CHANNEL`.

set -eux

rebuild() {
  bin/nim c --skipUserCfg --skipParentCfg koch.nim
  ./koch boot -d:release
  ./koch nimble
}

if [ "${CHANNEL}" = 'stable' ]; then
  readonly BRANCH_OR_TAG="v$(curl -sSfL --retry 3 https://nim-lang.org/channels/stable)"
else
  readonly BRANCH_OR_TAG="${CHANNEL}"
fi

readonly NIM_DIR="nim-${CHANNEL}"

cd -- "$(dirname -- "$0")" # Change directory to that of this script.

git clone -b "${BRANCH_OR_TAG}" --depth 1 https://github.com/nim-lang/Nim.git "${NIM_DIR}"
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
