#!/bin/sh

set -e

update_cacerts(){
    sudo cp /rancheros-git/cacerts/* /usr/local/share/ca-certificates
    sudo update-ca-certificates
}

update_cacerts

git "$@"