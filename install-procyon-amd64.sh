#!/bin/bash

RELEASE="0.0.6"
ARCHITECTURE="amd64"

# ------------------------------------
# Install Venusia
# ------------------------------------

wget https://github.com/bots-garden/procyon/releases/download/${RELEASE}/alcor-${RELEASE}-linux-${ARCHITECTURE}.tar.gz
mkdir venusia
tar -zxf venusia-${RELEASE}-linux-${ARCHITECTURE}.tar.gz --directory venusia
rm venusia-${RELEASE}-linux-${ARCHITECTURE}.tar.gz

# create the `functions` directory
# wasm modules will be uploaded in this directory 
mkdir venusia/functions


# ------------------------------------
# Install Procyon
# ------------------------------------

wget https://github.com/bots-garden/procyon/releases/download/${RELEASE}/procyon-${RELEASE}-linux-${ARCHITECTURE}.tar.gz
mkdir procyon
tar -zxf procyon-${RELEASE}-linux-${ARCHITECTURE}.tar.gz --directory procyon
rm procyon-${RELEASE}-linux-${ARCHITECTURE}.tar.gz

# create the `executors` directory
# we'll install the wasm hosts (as sat) in this directory
mkdir procyon/executors

# ------------------------------------
# Install Alcor
# ------------------------------------

wget https://github.com/bots-garden/procyon/releases/download/${RELEASE}/venusia-${RELEASE}-linux-${ARCHITECTURE}.tar.gz
mkdir alcor
tar -zxf alcor-${RELEASE}-linux-${ARCHITECTURE}.tar.gz --directory alcor
rm alcor-${RELEASE}-linux-${ARCHITECTURE}.tar.gz 
