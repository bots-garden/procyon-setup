#!/bin/bash
RELEASE="0.1.1"
ARCHITECTURE="arm64"
# ------------------------------------
# Install sat
# ------------------------------------
cp sat-arm64/sat-${RELEASE}-${ARCHITECTURE} procyon/executors/sat
chmod +x procyon/executors/sat
