#!/bin/sh

# TODO check $DUMBPROXY_IP is set
# echo script main
# echo $DUMBPROXY_IP

source ./install-bin-mkcert.sh
# TODO check no error

source ./generate-certs.sh
# TODO check no error

source ./install-bin-dumbproxy.sh
# TODO check no error

# source ./tune-firewalld.sh
# TODO check no error

source ./tune-systemd.sh
# TODO check no error

# test
# curl --proxy https://203.0.113.99 \
# 	--proxy-cacert rootCA.pem \
# 	--proxy-cert proxy-client.pem \
# 	--proxy-key proxy-client-key.pem \
# 	https://api.ipify.org ; echo

# must return ip of your proxy

# where 203.0.113.99 - your server ip


# cp ./install-bin-mkcert.sh  ./for-browser-linux/

echo SUCCESS install dumbproxy
