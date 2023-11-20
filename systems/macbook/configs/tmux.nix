{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    secureSocket = true;
    clock24 = true;
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
    ];
  };
}
