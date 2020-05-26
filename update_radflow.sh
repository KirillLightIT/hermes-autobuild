#!/bin/bash


TAGS=$@

if [ $TAGS ];
then
	ansible-playbook radflow-playbook.yaml --tags "update-repo,$TAGS,restart-radflow"
else
	ansible-playbook radflow-playbook.yaml --tags "update"
fi
