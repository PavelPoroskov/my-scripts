#!/bin/sh

sudo yum install nss-tools

curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
chmod +x mkcert-v*-linux-amd64
sudo cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert
rm mkcert-v*-linux-amd64

# test
# mkcert -version
