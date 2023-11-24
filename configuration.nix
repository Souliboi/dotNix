{ config, ... }:

{
  imports = [
  ./systems/macbook/configuration.nix
  ./systems/macbook/hardware-configuration.nix
  ./systems/macbook/configs/tmux.nix
  ];
}
