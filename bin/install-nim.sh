#!/bin/sh
#
# This script ensures that there is an up-to-date Nim installation in the
# directory named `nim-${CHANNEL}` in the same directory as this script.
# The script updates an existing installation or performs a clean install as
# needed.
#
# The environment variable `CHANNEL` determines the Nim version as follows:
# - If `CHANNEL` is `stable`: install from the latest Nim tag.
# - Otherwise, install from the latest commit on the branch named `CHANNEL`.

set -eux

rebuild() {
  bin/nim c --skipUserCfg --skipParentCfg koch.nim
  ./koch boot -d:release
  ./koch nimble
  # Reduce the cache size by removing unnecessary files.
  find . ! -name . -prune \
    ! -name '.git' ! -name 'bin' ! -name 'config' ! -name 'lib' \
    -exec rm -rf {} +
}

if [ "${CHANNEL}" = 'stable' ]; then
  readonly BRANCH_OR_TAG="v$(curl -sSfL --retry 3 https://nim-lang.org/channels/stable)"
else
  readonly BRANCH_OR_TAG="${CHANNEL}"
fi

readonly NIM_DIR="nim-${CHANNEL}"

cd -- "$(dirname -- "$0")" # Change directory to that of this script.

if [ ! -x "${NIM_DIR}/bin/nim" ] || [ ! -x "${NIM_DIR}/bin/nimble" ]; then
  # At least one of the binaries was not restored from the cache. Build them.
  rm -rf "${NIM_DIR}"
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
else
  # Nim and Nimble were in the cache. Rebuild them if there is a newer tag/commit.
  (
    cd "${NIM_DIR}"

    if [ "${CHANNEL}" = 'stable' ]; then
      git fetch --depth 1 origin tag "${BRANCH_OR_TAG}"
    else
      git fetch --depth 1 origin "${BRANCH_OR_TAG}"
    fi

    if ! git diff --quiet HEAD FETCH_HEAD; then
      git reset --hard FETCH_HEAD
      rebuild
      # Pretend that we did a fresh shallow clone of just the latest tag/commit.
      if [ "${CHANNEL}" = 'stable' ]; then
        git tag -d "$(git tag --list --sort=-creatordate | tail -n 1)" # Delete the older tag.
      fi
      git reflog expire --expire=all --all # Clear the reflog.
      git gc --prune=now
    fi
  )
fi
