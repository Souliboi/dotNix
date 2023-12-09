{ config, ... }:

{
  imports = [
  ./systems/macbook/configuration.nix
  ./systems/macbook/hardware-configuration.nix
  ./configs/starship.nix
  ];
}
