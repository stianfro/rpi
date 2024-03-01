#!/bin/bash


if [ -z "${SERVER_IP}" ]; then
    echo "Environment variable SERVER_IP is not set."
    exit 1
fi

k3sup install --ip $SERVER_IP \
              --user stianfroystein \
              --local-path "~/.kube/config.d/rpi" \
              --context "rpi" \
              --k3s-extra-args="--flannel-backend=none --disable-network-policy"
#             --k3s-extra-args="--flannel-backend=none --disable-network-policy --disable traefik --disable-kube-proxy"

ln -s ~/.kube/config ~/.kube/config.d/rpi

