#!/bin/bash

base="`dirname $BASH_SOURCE`"

echo -n "Checking for Ruby: "

if which ruby &> /dev/null; then
	echo "Yes"
else
	echo "No"
	
	echo "Installing Ruby"

	source $base/pkg_mng.sh
	
	pkg_mng install ruby
fi
