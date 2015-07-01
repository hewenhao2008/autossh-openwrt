#!/bin/sh

i=''
t='all'
while getopts i:t:h opt
do
    case $opt in
    'i'|'t' )
        eval $opt=$OPTARG
        ;;
    *)
        exit
        ;;
    esac
done

if [ "$t" != "all" ]; then
    exit 0
fi

opkg update
opkg install autossh
/etc/init.d/autossh disable
cp ./files/autossh.init /etc/init.d/autossh
chmod +x /etc/init.d/autossh
