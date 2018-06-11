#!/bin/bash
#
# Link all OS.js core modules globally
# Author: Anders Evenrud <andersevenrud@gmail.com>
# Licese: MIT
#

LIST=(
  osjs-common
  osjs-cli
  osjs-gui
  osjs-panels
  osjs-server
  osjs-client
  osjs-widgets
  osjs-dialogs
  osjs-standard-theme
  osjs-sqlite-auth
  osjs-pam-auth
)

pushd OS.js/
  npm install
popd

pushd packages/
  for d in ${LIST[*]}; do
    echo -e "\e[1mLinking '$d' into npm\e[0m"
    (cd $d; npm link)
  done
popd

pushd OS.js/
  for d in ${LIST[*]}; do
    l=${d/osjs-/@osjs\/}
    f=$(grep --quiet $l package.json)
    if $f; then
      echo -e "\e[1mLinking '$l' into OS.js\e[0m"
      npm link $l
    fi
  done

  echo -e "\e[1mSymlinking default OS.js packages\e[0m"
  pushd src/packages/
    ln -sf ../../../packages/osjs-standard-theme StandardTheme
    ln -sf ../../../packages/osjs-example-application ExampleApplication
  popd

  echo -e "\e[1mBuilding OS.js manifest\e[0m"
  npm run build:manifest
popd

echo -e "\e[1mLinking with lerna\e[0m"
npx lerna link
