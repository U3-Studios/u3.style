#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_DIR}/.."

# Make sure the submodules are updated
git submodule update --init

# Compile Go_Pong
./Go_Pong/scripts/build-wasm.sh

cp ./Go_Pong/build/go_pong.wasm ./web/games/gopong/go_pong.wasm
