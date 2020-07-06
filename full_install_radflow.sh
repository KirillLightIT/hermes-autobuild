#!/bin/bash


# Install requirements
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y \
	build-essential \
	git \
	wget \
	curl \
	jq \
	dcmtk \
	postgresql \
	postgresql-contrib \
	python-psycopg2 \
	redis \
	ansible \
	mc \
	tmux \
	nodejs \
	npm

# Install hermes
if [ -f "id_rsa" ]
then
	echo 'Key file found.'
	ansible-playbook radflow-playbook.yaml --tags "full-install"
else
	echo 'Key file was not found'
	exit
fi
