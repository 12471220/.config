#!/bin/bash

test=3

# Full and short texts
echo "test: $test"
echo "tst: $test"

# le means less or equal.
[ ${test} -le 5 ] && echo "#00FF00"
[ ${test} -le 20 ] && echo "#FF0000"

exit 0