#!/bin/sh

sudo apt-get -y remove docker docker-engine docker.io containerd runc
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo apt-get update && sudo apt-get -y install apt-transport-https \
                        ca-certificates \
                        curl \
                        gnupg \
                        lsb-release \
                        uidmap
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -fo /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install -y docker-ce-rootless-extras docker-ce docker-ce-cli containerd.io
dockerd-rootless-setuptool.sh install
systemctl --user enable docker
sudo loginctl enable-linger $(whoami)
echo 'export PATH=/usr/bin:$PATH' >> ~/.bashrc
echo 'export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock' >> ~/.bashrc


sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
