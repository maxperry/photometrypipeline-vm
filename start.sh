#!/bin/bash
if ! vagrant box list | grep -q 'maxperry/photopipe' ; then
   	vagrant box add maxperry/photopipe
fi

if ! vagrant status | grep -q 'The VM is running.' ; then
	vagrant up
fi

ssh -X -p 2222 vagrant@localhost
