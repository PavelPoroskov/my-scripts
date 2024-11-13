#!/bin/sh

curl --proxy https://203.0.113.99 \
	--proxy-cacert rootCA.pem \
	--proxy-cert test-client.pem \
	--proxy-key test-client-key.pem \
	https://api.ipify.org ; echo

# must return ip of your proxy
# where 203.0.113.99 - your server ip

