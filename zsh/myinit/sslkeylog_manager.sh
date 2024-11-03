#!/bin/bash

if [ -f $SSLKEYLOGFILE.old ]; then
    rm $SSLKEYLOGFILE.old
fi

mv $SSLKEYLOGFILE $SSLKEYLOGFILE.old
touch $SSLKEYLOGFILE
