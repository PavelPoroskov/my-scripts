#!/bin/sh

# TODO check $DUMBPROXY_IP is set
# echo script generate
# echo $DUMBPROXY_IP

mkdir -p dumbproxy-server
cd dumbproxy-server

# mkcert $DUMBPROXY_IP
# mkcert -client -pkcs12 dumbproxy-for-browser
export CAROOT=.
/usr/local/bin/mkcert $DUMBPROXY_IP
/usr/local/bin/mkcert -client -pkcs12 dumbproxy-for-browser
/usr/local/bin/mkcert -client test

cd -

# test ls -l certificates | grep $PROXY_IP
# 	203.0.113.99-key.pem
# 	203.0.113.99.pem
# 	rootCA.pem
# 	rootCA-key.pem
# 	dumbproxy-for-browser.p12 

sudo mkdir -p /etc/dumbproxy

sudo cp dumbproxy-server/rootCA.pem  /etc/dumbproxy/dumbproxy-ca.pem
sudo cp dumbproxy-server/${DUMBPROXY_IP}.pem  /etc/dumbproxy/dumbproxy-srv.pem
sudo cp dumbproxy-server/${DUMBPROXY_IP}-key.pem  /etc/dumbproxy/dumbproxy-srv-key.pem

# test ls -l /etc/dumbrpoxy | grep $PROXY_IP
# 	dumbproxy-ca.pem
# 	dumbproxy-srv.pem
# 	dumbproxy-srv-key.pem 

sudo cp dumbproxy-server/rootCA.pem  ./dumbproxy-browser/
sudo mv dumbproxy-server/dumbproxy-for-browser-client.p12  ./dumbproxy-browser/
sudo mv dumbproxy-server/test-client.pem  ./dumbproxy-browser/
sudo mv dumbproxy-server/test-client-key.pem  ./dumbproxy-browser/
