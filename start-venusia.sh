#!/bin/bash
# ------------------------------------
# Start Venusia
# ------------------------------------
cd venusia
REGISTRY_CRT="venusia.local.crt" \
REGISTRY_KEY="venusia.local.key" \
REGISTRY_HTTP=9999 \
./venusia

