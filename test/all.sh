#!/bin/bash

set -e

export TMPDIR_ROOT=$(mktemp -d /tmp/git-tests.XXXXXX)

on_exit() {
  exitcode=$?
  if [ $exitcode != 0 ] ; then
    echo -e '\e[41;33;1m'"Failure encountered!"'\e[0m'
    echo ""
    echo""
  fi

  rm -rf $TMPDIR_ROOT
}

trap on_exit EXIT

$(dirname $0)/check.sh
$(dirname $0)/get.sh
$(dirname $0)/put.sh

echo -e '\e[32;1m'"all tests passed!"'\e[0m'

