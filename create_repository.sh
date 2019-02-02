#!/bin/bash

set -eux

repo_name=$1

cd ..
cp -r tmpl-go "$repo_name"
rm -rf "$repo_name/.git"
rm -f "$repo_name/create_repository.sh"
sed -i 's@tmpl-go@'"$repo_name"'@g' "$repo_name/"*
