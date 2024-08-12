#!/bin/bash

set -ex

git clone https://fuchsia.googlesource.com/sdk-samples/getting-started fuchsia-getting-started --recurse-submodules
cd fuchsia-getting-started
scripts/bootstrap.sh
tools/bazel build @fuchsia_sdk//:fuchsia_toolchain_sdk

echo "SDK Version:"
tools/ffx sdk version

tools/bazel build products/reference:reference.x64.emu

# it's take longer to start emulator without kvm acceleration
tools/ffx config set emu.start.timeout 400

# install all dependencies in advance
tools/bazel fetch //src/hello_world:pkg.component
tools/bazel fetch //src/echo:pkg.component
