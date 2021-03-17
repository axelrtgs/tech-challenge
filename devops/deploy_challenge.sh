#!/bin/bash

vagrant up --provision

./bin/vagrant_command "find /vagrant/deployments/challenge/ -type f -name *.yaml | xargs -n1 kubectl apply -f"

curl --resolve challenge.domain.local:80:192.168.0.250 http://challenge.domain.local
