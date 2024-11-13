cd dumbroxy-browser

# test proxy
curl --proxy https://203.0.113.99 \
	--proxy-cacert rootCA.pem \
	--proxy-cert test-client.pem \
	--proxy-key test-client-key.pem \
	https://api.ipify.org ; echo

# install CA to OS trust store and browser trust store
./install-certs.sh

# browser Firefox 
# Settings/ General Settings/ Network settings
# Automatic proxy configuration URL : 
# data:,function FindProxyForURL(u, h){return "HTTPS 203.0.113.99";}
#
# where 203.0.113.99 - ip of your proxy

# browser firefox/ Settings / Privacy and Security Settings / Certificates: View Certificates / Your certificates: Import
# import your certificate from dumbproxy-for-browser-client.p12
