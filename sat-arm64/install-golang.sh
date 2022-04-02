#!/bin/bash

wget https://go.dev/dl/go1.17.7.linux-arm64.tar.gz
sudo tar -C /usr/local -xzf go1.17.7.linux-arm64.tar.gz
rm go1.17.7.linux-arm64.tar.gz

echo "export PATH=$PATH:/usr/local/go/bin" >> .bashrc
