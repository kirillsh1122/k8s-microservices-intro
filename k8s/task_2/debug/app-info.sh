#!/bin/bash

TARGET_IP=$1
PORT=$2

if [ -z "$TARGET_IP" ]; then
    echo "Usage: $0 <target_node ip> <port>"
    exit 1
fi

if [ -z "$PORT" ]; then
    echo "Usage: $0 <target_node ip> <port>"
    exit 1
fi

i=1

while true; do
    curl -s "${TARGET_IP}:${PORT}/actuator/info" | \
        jq -c --argjson iteration "$i" '.build | {iteration: $iteration, name, version}'

    i=$((i + 1))
    sleep 5
done
