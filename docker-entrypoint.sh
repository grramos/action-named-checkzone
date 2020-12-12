#!/bin/bash        
set -ex


if [ -z "$(which named-checkzone)" ]; then
    echo "named-checkzone is missing. Ensure you have the bind9utils installed."
    exit 1
fi
prefix='.*db.'
find . -type f -name 'db.*' |
while read zonefile; do
    zone=`echo $zonefile | sed -e "s/^$prefix//"`
    named-checkzone -d -k fail -n fail -m fail -M fail $zone $zonefile

    if [ $? -ne 0 ]; then
        exit $?
    fi
done

exit
