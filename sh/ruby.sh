#!/bin/bash

local base="`dirname $BASH_SOURCE`"
source $base/pkg_mng.sh

pkg_mng install ruby
