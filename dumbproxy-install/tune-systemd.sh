#!/bin/sh

sudo cp ./etc-default-dumbproxy--options.txt /etc/default/dumbproxy
sudo cp ./etc-systemd-system--dumbproxy.service.txt /etc/systemd/system/dumbproxy.service

sudo systemctl daemon-reload
sudo systemctl enable dumbproxy
sudo systemctl start dumbproxy

# test
# sudo systemctl list-units –type=service | grep dumbproxy
# journalctl -u dumbproxy.service