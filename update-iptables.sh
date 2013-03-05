#!/bin/bash

iptables-restore < iptables.rules
ip6tables-restore < ip6tables.rules

cp iptables.rules /etc/iptables/custom.rules
cp ip6tables.rules /etc/iptables/custom_ipv6.rules
