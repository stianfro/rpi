#!/bin/bash

if [ -z "${SERVER_IP}" ]; then
    echo "Environment variable SERVER_IP is not set."
    exit 1
fi

ssh "${SERVER_IP}" 'sudo /usr/local/bin/k3s-uninstall.sh'

