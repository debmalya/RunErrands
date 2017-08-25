#!/bin/sh
ls $1 >/dev/null 2>&1 && echo "found ${1}" || echo "did not find ${1}"
