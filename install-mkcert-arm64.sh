#!/bin/bash

ARCHITECTURE="arm64"

# ------------------------------------
# Install Mkcert to generate
# self-signed certificates
# ------------------------------------

sudo apt install libnss3-tools -y
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-${ARCHITECTURE}
sudo cp mkcert-v1.4.3-linux-${ARCHITECTURE} /usr/local/bin/mkcert
sudo chmod +x /usr/local/bin/mkcert
rm mkcert-v1.4.3-linux-${ARCHITECTURE}

# ------------------------------------
# Generate self-signed certificates
# for Venusia
# ------------------------------------
cd venusia
mkcert -install
mkcert venusia.local localhost 127.0.0.1 ::1
cp venusia.local+3-key.pem venusia.local.key
cp venusia.local+3.pem venusia.local.crt
rm *.pem
