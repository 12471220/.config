#!/bin/bash

if [[ -f $SSLKEYLOGFILE ]]; then
    mv $SSLKEYLOGFILE $SSLKEYLOGFILE.old
fi
touch $SSLKEYLOGFILE
