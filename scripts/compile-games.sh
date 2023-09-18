#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_DIR}/.."

# Make sure the submodules are updated
git submodule update --init

# Stash eventual git changes
git stash

# Compile Go_Pong
./Go_Pong/scripts/build-wasm.sh

# Copy to our folder
cp ./Go_Pong/build/go_pong.wasm ./web/games/gopong/go_pong.wasm

# Git magic, add, commit, restore stashed changes
git add web/games/gopong/go_pong.wasm
git commit -m "Update Go_Pong"
git stash pop
