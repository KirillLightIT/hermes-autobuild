#!/bin/bash


TAGS=$@

if [[ -f 'id_rsa' ]]
then
	echo 'Key file found.'

  if [[ "$TAGS" ]];
  then
    ansible-playbook radflow-playbook.yaml --tags "update-repo,update-packages,migrate,$TAGS,restart-radflow"
  else
    ansible-playbook radflow-playbook.yaml --tags 'update'
  fi

else
	echo 'Key file was not found'
	exit
fi
