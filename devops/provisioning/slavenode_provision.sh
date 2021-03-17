#!/bin/bash

set -xe

# add slave node to cluster
bash -x "/vagrant/auto_gen/add_${HOSTNAME}"
