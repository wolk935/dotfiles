#!/bin/bash

iptables-restore < iptables.rules
ip6tables-restore < ip6tables.rules

cp iptables.rules /etc/iptables/iptables.rules
cp ip6tables.rules /etc/iptables/ip6tables.rules
