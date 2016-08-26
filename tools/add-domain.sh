#!/usr/bin/env bash

lists=$1
domain=$2

echo $domain >> $lists

gsort -o /var/tmp/light-list.tmp $lists 
cat /var/tmp/light-list.tmp > $lists
rm /var/tmp/light-list.tmp
