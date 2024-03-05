#!/bin/bash


if [ -z "${SERVER_IP}" ]; then
    echo "Environment variable SERVER_IP is not set."
    exit 1
fi

k3sup install --ip "${SERVER_IP}" \
              --user stianfroystein \
              --local-path "${HOME}/.kube/config.d/rpi" \
              --context "rpi" \
              --k3s-extra-args="--flannel-backend=none --disable-network-policy --disable=traefik --disable-kube-proxy --disable=servicelb"

# ln -s ~/.kube/config ~/.kube/config.d/rpi

