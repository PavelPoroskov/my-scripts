CA_NANE=my-test-ca
CA_PRIVATE_KEY=ca/"$CA_NANE".key
CA_CERTIFICATE=ca/"$CA_NANE".crt


COMMON_NAME=my-test-server
SUBJECT_ALT_NAME=IP:1.2.3.4
EMAIL=test-user@gmail.com

SERVER_NANE=$COMMON_NAME
SERVER_PRIVATE_KEY=server/"$SERVER_NANE".key
SERVER_REQUEST=server/"$SERVER_NANE".csr
SERVER_CERTIFICATE=server/"$SERVER_NANE".crt

SERVER_PRIVATE_KEY_TXT=txt/$(basename "$SERVER_PRIVATE_KEY").txt
SERVER_REQUEST_TXT=txt/$(basename "$SERVER_REQUEST").txt
SERVER_CERTIFICATE_TXT=txt/$(basename "$SERVER_CERTIFICATE").txt

rm -f $SERVER_PRIVATE_KEY
rm -f $SERVER_PRIVATE_KEY_TXT
rm -f $SERVER_REQUEST
rm -f $SERVER_REQUEST_TXT
rm -f $SERVER_CERTIFICATE
rm -f $SERVER_CERTIFICATE_TXT

openssl genrsa -out $SERVER_PRIVATE_KEY 4096
openssl rsa -noout -text -in $SERVER_PRIVATE_KEY > $SERVER_PRIVATE_KEY_TXT

#  -addext "authorityKeyIdentifier=keyid,issuer" \
openssl req -new -key $SERVER_PRIVATE_KEY -out $SERVER_REQUEST \
  -subj "/C=US/ST=NRW/L=Earth/O=CompanyName/OU=IT/CN=$COMMON_NAME/emailAddress=$EMAIL" \
  -addext "basicConstraints = CA:false" \
  -addext "subjectKeyIdentifier=hash" \
  -addext "keyUsage=digitalSignature,nonRepudiation,keyEncipherment,dataEncipherment" \
  -addext "nsComment = OpenSSL Generated Certificate" \
  -addext "subjectAltName = $SUBJECT_ALT_NAME"
openssl req -noout -text -in $SERVER_REQUEST > $SERVER_REQUEST_TXT


openssl x509 -req -days 3650 -in $SERVER_REQUEST -CA $CA_CERTIFICATE -CAkey $CA_PRIVATE_KEY \
  -CAcreateserial -out $SERVER_CERTIFICATE -copy_extensions copy
openssl x509 -noout -text -in $SERVER_CERTIFICATE > $SERVER_CERTIFICATE_TXT
