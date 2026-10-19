#!/usr/bin/env sh
set -eu

cargo build --release
cargo test

if [ ! -x build/release/hello ]; then
    echo "Expected executable not found: build/release/hello" >&2
    exit 1
fi
