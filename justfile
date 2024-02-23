set dotenv-load

install-k3s:
    bash scripts/k3s-install.sh

install-cilium:
    bash scripts/cilium-install.sh

uninstall:
    bash scripts/uninstall.sh

rotate:
    bash scripts/rotate.sh
