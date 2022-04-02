#!/bin/bash
# ------------------------------------
# Install the Suborbital CLI
# ------------------------------------
VERSION="0.4.2"

mkdir subo
cd subo
wget https://github.com/suborbital/subo/releases/download/v${VERSION}/subo-v${VERSION}-linux-arm64.tar.gz
tar -xzf subo-v${VERSION}-linux-arm64.tar.gz
rm subo-v${VERSION}-linux-arm64.tar.gz
sudo cp subo /usr/local/bin
cd ..
rm -rf subo
