#!/bin/bash

set -e

source $(dirname $0)/helpers.sh

# --- DEFINE TESTS ---

it_can_check_from_head() {
  local repo=$(init_repo)
  local ref=$(make_commit $repo)

  check uri $repo branches '.*' | jq -e "
    . == [{ref: $(echo "$ref:master" | jq -R .)}]
  "
}

# --- RUN TESTS ---

run it_can_check_from_head

