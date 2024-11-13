#!/bin/sh

source ./install-bin-mkcert.sh

export CAROOT=.
mkcert -install

