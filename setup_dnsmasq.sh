#!/bin/bash

sudo apt-get install -yq dnsmasq

sudo systemctl stop systemd-resolved.service
sudo systemctl disable systemd-resolved.service

sudo rm /etc/resolv.conf
echo '
nameserver 127.0.0.1
nameserver 8.8.8.8
nameserver 8.8.4.4
' | sudo tee /etc/resolv.conf

echo '
server=/consul/127.0.0.1#8600
server=8.8.8.8
server=8.8.4.4
resolv-file=/etc/resolv.conf
' | sudo tee /etc/dnsmasq.d/default

echo '
conf-dir=/etc/dnsmasq.d
' | sudo tee /etc/dnsmasq.conf

sudo systemctl restart dnsmasq
