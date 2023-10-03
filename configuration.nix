# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "NixVM";

  # Network
  networking.networkmanager.enable = true;  

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_INDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap
  services.xserver = {
    layout = "us";
    xkbVariant = "altgr-intl";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.soul = {
    description = "Soul";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      neofetch
      neovim
      feh
      picom
      neovim
      wezterm
      polybar
      arandr
      rofi
      pavucontrol
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
      btop
      firefox
      discord
      flameshot
    ];
  };

  # Nushell
  users.defaultUserShell = pkgs.nushell;
  environment.shells = with pkgs; [ nushell ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    git
    gcc_multi
    rustup
    nushell
    go
    wget
  ];

  # Fonts
  fonts.fonts = with pkgs; [
    noto-fonts
    font-awesome
  ];

  # JetBrainsMono Nerd please
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Some programs
  programs.nm-applet.enable = true;

  # LeftWM
  services.xserver = {
    enable = true;
    windowManager.leftwm.enable = true;
    displayManager.lightdm.enable = true;
  };

  # Enable Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable Bluetooth
  #hardware.bluetooth.enable = true;
  #services.blueman.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Firewall
  networking.firewall.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

