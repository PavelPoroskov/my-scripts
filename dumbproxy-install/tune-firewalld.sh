#!/bin/sh

sudo cp ./etc-firewalld-services--dumbproxy.xml /etc/firewalld/services/dumbproxy.xml
sudo cp ./etc-firewalld-services--dumbproxy.xml /usr/lib/firewalld/services/dumbproxy.xml

sudo firewall-cmd --reload
sudo firewall-cmd --zone=public --add-service=dumbproxy --permanent
sudo firewall-cmd --reload

# test
# sudo firewall-cmd --list-all | grep dumbproxy
# sudo firewall-cmd --info-service=dumbproxy