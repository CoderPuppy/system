#!/bin/sh

# Requirements
#   - Git
#   - Package Manager Support

resolve_link() {
  $(type -p greadlink readlink | head -1) "$1"
}

abs_dirname() {
  set -x
  local cwd path
  cwd="`pwd`"
  path="$1"

  while [ -n "$path" ]; do
    cd "${path%/*}"
    local name="${path##*/}"
    path="$(resolve_link "$name" || true)"
  done

  pwd
  cd "$cwd"
}

base="`abs_dirname $0`"


# Get Ruby
. $base/ruby.sh

ruby ../ruby/continue.rb
