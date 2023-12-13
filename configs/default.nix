{config, lib, ... }:

{
    imports = [
        ./cpu-freq.nix
        ./lightdm.nix
        ./lock.nix
        ./packages.nix
        ./wm.nix
    ];
}
