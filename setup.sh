#!/usr/bin/env bash

setup_dir=/workspaces/codespaces-setup
token_name=CODESPACES_PAT

if [ -z "${token_name}" ]; then
  echo "You need to set a PAT in ${token_name}!"
  exit 1
fi

if [ ! -d "${setup_dir}" ]; then
  git clone https://"${!token_name}"@github.com/bradshjg/codespaces-setup.git "${setup_dir}"
else
  cd ${setup_dir} && git pull
fi

cd ${setup_dir} && ./setup.sh
