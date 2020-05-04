#!/bin/bash


TAGS=$@

if [ $TAGS ];
then
	ansible-playbook hermes-playbook.yaml --tags "update-repo,$TAGS,restart-hermes"
else
	ansible-playbook hermes-playbook.yaml --tags "update"
fi
