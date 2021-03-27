#!/bin/bash

sudo apt-get install -yq dnsmasq
sudo systemctl disable systemd-resolved.service

sudo rm /etc/resolv.conf
echo '
nameserver 1.1.1.1
nameserver 1.0.0.1
' | sudo tee /etc/resolv.conf

echo '
port=53
resolv-file=/var/run/dnsmasq/resolv.conf
bind-interfaces
listen-address=127.0.0.1
server=/consul/127.0.0.1#8600
' | sudo tee /etc/dnsmasq.d/default

sudo systemctl restart dnsmasq
