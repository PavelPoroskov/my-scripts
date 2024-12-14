#!/bin/sh 

sudo cp etc-systemd-system--fix-wake-up.service /etc/systemd/system/fix-wake-up.service
sudo chmod 644 /etc/systemd/system/fix-wake-up.service
sudo systemctl enable fix-wake-up.service
