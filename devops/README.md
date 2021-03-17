# Tech Challenge

## Prerequisites

- VirtualBox.
- Vagrant
- Virtualization enabled on your system (if using Windows).

### Installing VirtualBox

In order to install VirtualBox, use this link:

<https://www.virtualbox.org/wiki/Downloads>

### Installing Vagrant

Vagrant offers install options for all operating systems as well:

<https://www.vagrantup.com/downloads.html>

There are installers for Mac, Windows, Debian and CentOS.

**Pro Tip:** if you are on macOS you can use `brew install vagrant virtualbox virtualbox-extension-pack`
to get setup quickly

## Getting Started

To run the challenge:

```bash
git clone https://github.com/cloud-hero/flinks-tech-challenges.git
cd flinks-tech-challenges/devops
source ./deploy_challenge.sh
```

To shutdown the challenge environment run `source ./destroy_challenge.sh`

If you want to execute commands against the kubernetes cluster you can either:

- `vagrant ssh k8s01` and once inside the box you can use the `microk8s`,
`docker` and `kubectl` commands
- `./bin/vagrant_remote [command]` which will remotely run the command in the box
without leaving your shell
- You can source `./bin/alias` or `./bin/activate` which will enable you to use
your local `kubectl` to connect to the remote cluster.
  - Source `./bin/unalias` or `./bin/deactivate` to restore your original
  `kubectl` environment.
