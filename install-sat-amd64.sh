#!/bin/bash
RELEASE="0.1.1"
ARCHITECTURE="amd64"
# ------------------------------------
# Install sat
# ------------------------------------

wget https://github.com/suborbital/sat/releases/download/v${RELEASE}/sat-v${RELEASE}-linux-${ARCHITECTURE}.tar.gz

tar -zxf sat-v${RELEASE}-linux-${ARCHITECTURE}.tar.gz --directory procyon/executors

rm sat-v${RELEASE}-linux-${ARCHITECTURE}.tar.gz 
