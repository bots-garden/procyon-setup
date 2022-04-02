#!/bin/bash
# ------------------------------------
# Install sat
# ------------------------------------
git clone --depth=1 https://github.com/suborbital/sat
cd sat
make sat
cp .bin/sat ../procyon/executors
cd ..
rm -rf sat

