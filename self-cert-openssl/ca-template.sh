COMMON_NAME=my-test-ca
SUBJECT_ALT_NAME=IP:1.2.3.4
EMAIL=test-user@gmail.com

CA_NANE=$COMMON_NAME
CA_PRIVATE_KEY=ca/"$CA_NANE".key
CA_CERTIFICATE=ca/"$CA_NANE".crt

CA_PRIVATE_KEY_TXT=txt/$(basename "$CA_PRIVATE_KEY").txt
CA_CERTIFICATE_TXT=txt/$(basename "$CA_CERTIFICATE").txt

rm -f $CA_PRIVATE_KEY
rm -f $CA_PRIVATE_KEY_TXT
rm -f $CA_CERTIFICATE
rm -f $CA_CERTIFICATE_TXT

# openssl genrsa -des3 -passout file:$CA_PASSPHRASE -out $CA_PRIVATE_KEY 4096
openssl ecparam -out $CA_PRIVATE_KEY -name prime256v1 -genkey
openssl ecparam -noout -text -in $CA_PRIVATE_KEY > $CA_PRIVATE_KEY_TXT

openssl req -new -x509 -days 3650 -key $CA_PRIVATE_KEY -out $CA_CERTIFICATE \
  -subj "/C=US/ST=NRW/L=Earth/O=CompanyName/OU=IT/CN=$COMMON_NAME/emailAddress=$EMAIL" \
  -addext "basicConstraints = critical,CA:true" \
  -addext "subjectKeyIdentifier=hash" \
  -addext "authorityKeyIdentifier=keyid:always,issuer" \
  -addext "keyUsage=critical,keyCertSign,cRLSign" \
  -addext "nsComment = OpenSSL Generated Certificate" \
  -addext "subjectAltName = $SUBJECT_ALT_NAME"

openssl x509 -noout -text -in $CA_CERTIFICATE > $CA_CERTIFICATE_TXT
