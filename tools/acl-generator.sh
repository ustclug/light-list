#!/bin/bash

lists=$1

awk '{printf("acl abroad-site dstdomain .%s\n",$1)}' $lists
