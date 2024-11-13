#!/bin/sh

# sudo curl -Lo /usr/local/bin/dumbproxy	'https://github.com/SenseUnit/dumbproxy/releases/download/v1.13.1/dumbproxy.linux-amd64' 
# sudo chmod +x /usr/local/bin/dumbproxy

curl -JLO "https://github.com/SenseUnit/dumbproxy/releases/download/v1.13.1/dumbproxy.linux-amd64"
chmod +x dumbproxy.linux-amd64
sudo cp dumbproxy.linux-amd64 /usr/local/bin/dumbproxy
rm dumbproxy.linux-amd64

# test
# dumbproxy -version
