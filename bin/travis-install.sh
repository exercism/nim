#!/bin/sh

# Travis CI uses this script to build:
# - Nim from the tarball given by the `NIM_VERSION` environmental variable.

set -eux

cd bin
wget "https://nim-lang.org/download/nim-${NIM_VERSION}.tar.xz"
tar xf "nim-${NIM_VERSION}.tar.xz"
(
  cd "nim-${NIM_VERSION}"
  sh build.sh
)
