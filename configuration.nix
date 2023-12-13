{ config, lib, ... }:

{
  imports = [
    ./systems/macbook/default.nix
    ./configs/default.nix
  ];
}
