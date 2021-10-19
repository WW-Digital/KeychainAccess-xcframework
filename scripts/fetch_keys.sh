#!/bin/bash
set -uo pipefail

echo "--- :package: Clone common script"
git clone git@github.com:WW-Digital/ios-common-config.git

echo "--- :key: Retrieve secrets from IDB"
touch .bash_env
export BASH_ENV="$PWD/.bash_env"
bash ./ios-common-config/circleci/fetch-keys.sh WWMobile .
source .bash_env