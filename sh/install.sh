#!/bin/bash

echo -n "Checking for Git: "

if which git &> /dev/null; then
	echo "Yes"
else
	echo "No"

	echo "Installing Git"
	pkg_mng install git
fi

git clone git://github.com/system-setup/system /tmp/system

cd /tmp/system

./sh/continue.sh
