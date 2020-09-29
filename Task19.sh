#!/bin/sh
find . -name '*.vb' | xargs wc -l | sort -nr
