#!/bin/bash

IFS=',' read -r -a servers <<< "$BACKEND_SERVERS"

for i in "${!servers[@]}"
do
    server=${servers[$i]}
    echo "server srv${i} $server maxconn 10000 weight 10 cookie srv${i} check" >> /usr/local/etc/haproxy/haproxy.cfg
done

haproxy -f /usr/local/etc/haproxy/haproxy.cfg
