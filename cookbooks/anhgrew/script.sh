#!/bin/bash +x
set -o nounset

CHEF_WORKSTATION_TARGET_VERSION=18.2.7
CHEF_WORKSTATION_INSTALLED_VERSION=$(chef --version 2>/dev/null |awk '/Infra Client version:/ {print $NF}')
if [[ "${CHEF_WORKSTATION_INSTALLED_VERSION}" == "" ]]; then
  echo "Installing ChefDK ${CHEF_WORKSTATION_TARGET_VERSION}"
  curl --silent --show-error https://omnitruck.chef.io/install.sh | \
  sudo -E bash -s -- -c stable -v ${CHEF_WORKSTATION_TARGET_VERSION}
fi

eval "$(chef shell-init bash)"
echo "Downloading cookbook dependencies with Berkshelf"
berks vendor

echo "Running chef-client in local mode"
sudo chef-client --local-mode \
  --config-option cookbook_path="$(pwd)/berks-cookbooks" \
  --override-runlist anhgrew

echo "Cleaning up"
sudo rm -rf nodes
sudo rm -rf berks-cookbooks
