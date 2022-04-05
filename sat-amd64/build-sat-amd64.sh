#!/bin/bash
RELEASE="0.1.1"
ARCHITECTURE="amd64"

# ------------------------------------
# Install sat
# ------------------------------------
git clone --depth=1 https://github.com/suborbital/sat.git

cd sat
go build -o .bin/sat -tags netgo,wasmtime .
cp .bin/sat ../sat-${RELEASE}-${ARCHITECTURE}
cd ..
rm -rf sat

