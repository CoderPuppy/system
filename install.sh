#!/bin/bash

super() {
	if which sudo; then
		sudo $*
	else
		echo "No known way to become root"
		exit 1
	fi
}

pkg_mng_apt_get() {
	command=$1

	shift

	case $command in
	install)
		super apt-get install $*
		;;
	esac
}

pkg_mng_yum() {
	command=$1
	
	shift

	case command in
	install)
		super yum install $@
		;;
	esac
}

pkg_mng=""

pkg_mng() {
	if [ "$pkg_mng" = "" ]; then
		pkg_mng=`find_pkg_mng`
		
		echo "Using $pkg_mng"
	fi
	
	pkg_mng_${pkg_mng} $@
}

find_pkg_mng() {
	if which apt-get &> /dev/null; then
		echo "apt_get"
	elif which yum &> /dev/null; then
		echo "yum"
	else
		echo "No known package manager"
		exit 1
	fi
}

#!/bin/bash

pkg_mng install git

git clone git://github.com/system-setup/system /tmp/system

cd /tmp/system

source sh/continue.sh
