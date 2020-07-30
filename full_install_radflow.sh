#!/bin/bash


# Install requirements
add-apt-repository --yes ppa:certbot/certbot
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y \
	build-essential \
	git \
	wget \
	curl \
	jq \
	dcmtk \
	python-psycopg2 \
	redis-tools \
	ansible \
	mc \
	tmux \
	nodejs \
	npm \
	nginx \
    certbot \
    python3-certbot-nginx


# Install docker
curl https://get.docker.com | sh

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


# Install hermes
if [[ -f 'id_rsa' ]]
then
	echo 'Key file found.'
	ansible-playbook radflow-playbook.yaml --tags 'full-install'
else
	echo 'Key file was not found'
	exit 1
fi
