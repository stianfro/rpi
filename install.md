```shell
k3sup install --ip $SERVER_IP --user stianfroystein --k3s-extra-args="--flannel-backend=none --disable-network-policy --disable traefik --disable-kube-proxy"
cilium install --version 1.15.1 \
               --set=ipam.operator.clusterPoolIPv4PodCIDRList="10.42.0.0/16" \
               --set=l2announcements.enabled=true \
               --set=externalIPs.enabled=true \
               --set=kubeProxyReplacement=true
```
