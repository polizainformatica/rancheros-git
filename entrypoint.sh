#!/bin/sh

set -e

update_cacerts(){
    sudo update-ca-certificates
}

update_cacerts

git "$@"