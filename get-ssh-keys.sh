#!/usr/bin/env bash
set -xe

if ! ./decrypt.sh id_ed25519.enc; then
    echo "Failed to decrypt file, aborting"
    exit 1
fi

mkdir -p $HOME/.ssh
sudo install -o $USER -g $USER -m 0644 id_ed25519.pub $HOME/.ssh
sudo install -o $USER -g $USER -m 0600 id_ed25519 $HOME/.ssh

rm ./id_ed25519
