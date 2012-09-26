#!/bin/bash

# Requirements
#   - Git

base="`dirname $BASH_SOURCE`"

# Get Ruby
source $base/ruby.sh

ruby ../ruby/continue.rb
