#!/bin/sh
find $1 -name "*.gz" -execdir tar zxvf "{}" \;
