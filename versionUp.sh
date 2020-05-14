#!/bin/sh

POD_SPEC_FILE=`echo $1`;
MINOR_VERSION=`sed -n 's/.*s\.version.*=.*\"*.\.\(.*\)\"/\1/p' $POD_SPEC_FILE`;
((MINOR_VERSION++));
sed -i -E "s/\(.*s\.version.*=.*\"*.\.\).*\(\".*\)/\1$MINOR_VERSION\2/" $POD_SPEC_FILE;
FULL_VERSION=`sed -n 's/.*s\.version.*=.*\"\(.*.\..*\)\"/\1/p' $POD_SPEC_FILE`;
echo $FULL_VERSION;
