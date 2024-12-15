#!/bin/bash

# nix 설치
sh <(curl -L https://nixos.org/nix/install)

# nix-darwin 설정
nix --extra-experimental-features 'nix-command flakes' \
  run nix-darwin -- switch --flake ~/.config/nix#main