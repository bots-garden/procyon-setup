#!/bin/bash
# ------------------------------------
# WasmEdge dependencies
# ------------------------------------
wget -qO- https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- -v 0.9.0-r$
source $HOME/.wasmedge/env

# ------------------------------------
# Install sat
# ------------------------------------
git clone https://github.com/suborbital/sat.git
cd sat
go build -o .bin/sat -tags netgo,wasmedge .
cp sat ../procyon/executors
cd ..
rm -rf sat

