#!/bin/bash
RELEASE="0.1.1"
ARCHITECTURE="arm64"
# ------------------------------------
# WasmEdge dependencies
# ------------------------------------
curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash

source $HOME/.wasmedge/env

# ------------------------------------
# Install sat
# ------------------------------------
git clone --depth=1 https://github.com/suborbital/sat.git

cd sat
go build -o .bin/sat -tags netgo,wasmedge .
cp sat ../sat-${RELEASE}-${ARCHITECTURE}
cd ..
rm -rf sat
