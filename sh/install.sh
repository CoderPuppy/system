#!/bin/bash

pkg_mng install git

git clone git://github.com/system-setup/system /tmp/system

cd /tmp/system

./sh/continue.sh
