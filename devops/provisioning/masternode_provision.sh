#!/bin/bash

set -xe

# Wait until k8s cluster is up
# Prevents an error when enabling addons
sleep 45

# Enable microk8s add-ons
microk8s.enable dns registry helm3
microk8s.enable metallb:192.168.0.250-192.168.0.254

mkdir -p /vagrant/auto_gen


# Add kubeconfig to vagrant and root user (for helm and others)
mkdir -p /home/vagrant/.kube
microk8s config > /home/vagrant/.kube/config
chown -R vagrant /home/vagrant/.kube

mkdir -p /home/vagrant/.kube
microk8s config > /root/.kube/config
chown -R root:root /root/.kube

# Copy kubeconfig to host
cp /home/vagrant/.kube/config /vagrant/auto_gen/.kube_config

# Save commands to add secondary nodes to cluster
local_ip="$(ip route | grep default | grep enp0s8 | cut -d' ' -f9)"
microk8s.add-node | grep "${local_ip}" | tee /vagrant/auto_gen/add_k8s02
microk8s.add-node | grep "${local_ip}" | tee /vagrant/auto_gen/add_k8s03

# Add NGINX ingress controller via helm
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
kubectl create namespace ingress-controller
helm install nginx-ingress nginx-stable/nginx-ingress -n ingress-controller
