#!/bin/bash

rc=0

if [ -z "$(which named-checkzone)" ]; then
  echo "named-checkzone is missing. Ensure you have the bind9utils installed."
  exit 1
fi

find $GITHUB_WORKSPACE -type f -name 'db.*' |
while read zonefile; do
    zone=`echo $zonefile | sed -e "s/^\/.*\/db\.\(.*\)$/\1/"`
    named-checkzone $zone $zonefile
    if [ $? -ne 0 ]; then
      rc=1
    fi
done

exit $rc
