#!/bin/bash

set -eux

repo_name=$1

cd ..
cp -r tmpl-go "$repo_name"
rm -rf "$repo_name/.git"
rm -f "$repo_name/create_repository.sh"

cd "$repo_name"

find . -type d -name vendor -prune \
  -o -type f \
  -exec sed -i 's@tmpl-go@'"$repo_name"'@g' {} \;
hub init
hub create
hub add README.md
hub commit -m ":tada:init commit"
hub push --set-upstream origin master
