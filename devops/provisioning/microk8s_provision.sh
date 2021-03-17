#!/bin/bash

set -xe

HELM_VERSION=3.2.4
MICROK8S_VERSION=1.19/stable

# install helm3
wget "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz"
tar -xzf "helm-v$HELM_VERSION-linux-amd64.tar.gz"
mv linux-amd64/helm /usr/local/bin/helm
rm -rf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" linux-amd64

# disable swap for k8s
swapoff -a
sed -i '/swap/d' /etc/fstab

# install docker managing images
snap install docker

# Install and alias microk8s
snap install microk8s --classic --channel="${MICROK8S_VERSION}"
snap alias microk8s.kubectl kubectl
microk8s.status --wait-ready
usermod -a -G microk8s vagrant
