#!/bin/bash
#
# Clone all OS.js modules
# Author: Anders Evenrud <andersevenrud@gmail.com>
# Licese: MIT
#

LIST=(
  os-js/osjs-common
  os-js/osjs-cli
  os-js/osjs-gui
  os-js/osjs-panels
  os-js/osjs-server
  os-js/osjs-client
  os-js/osjs-widgets
  os-js/osjs-dialogs
  os-js/osjs-standard-theme
  os-js/osjs-sqlite-auth
  os-js/osjs-pam-auth
  os-js/osjs-example-provider
  os-js/osjs-example-application
  os-js/osjs-example-iframe-application
  os-js/osjs-preview-application
  os-js/osjs-pdfreader-application
  os-js/osjs-musicplayer-application
  os-js/osjs-htmlviewer-application
  os-js/osjs-calculator-application
  os-js/osjs-filemanager-application
  os-js/osjs-textpad-application
  os-js/osjs-xpra-application
  os-js/osjs-xterm-application
)

git clone -b v3 --single-branch git@github.com:os-js/OS.js.git

pushd packages/
  for d in ${LIST[*]}; do
    echo -e "\e[1mCloning '$d'\e[0m"
    git clone git@github.com:os-js/$d.git
  done
popd
