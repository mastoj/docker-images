#!/bin/bash

eth0=$(ip -o -4 addr list eth0 | grep -o '\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}')

echo "eth0 env variable is set to: " $eth0
echo "Arguments passed to eventstore: " $@

args2=()
for var in "$@"
do
    echo "Variable: $var"
    eval x=$var
    echo $x
    args2+=($x)
done
echo "Expanded arguments passed to eventstore: " ${args2[*]}


./run-node.sh \
    --ext-tcp-port=$EXT_TCP_PORT --int-tcp-port=$INT_TCP_PORT \
    --ext-http-port=$EXT_HTTP_PORT --int-http-port=$INT_HTTP_PORT \
    ${args2[*]}