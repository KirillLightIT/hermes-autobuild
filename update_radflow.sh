#!/bin/bash


TAGS=$@

if [ $TAGS ];
then
	ansible-playbook radflow-playbook.yaml --tags "update-repo,update-packages,migrate,$TAGS,restart-radflow"
else
	ansible-playbook radflow-playbook.yaml --tags "update"
fi
