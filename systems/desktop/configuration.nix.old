{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Grub
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 10;
      gfxmodeEfi = "1920x1080";
    };
  };

  # Network
  networking = {
    hostName = "NixOS";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowPing = false;
    };
  };

  # Time and Locale
  time.timeZone = "Europe/Berlin";
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

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # User 
  users.users.soul = {
    description = "Soul";
    isNormalUser = true;
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    packages = with pkgs; [
      # Packages I deem to be minimum, yes that includes neofetch
      neofetch
      neovim
      wezterm
      btop
      firefox
      discord
      xclip
      fwupd-efi
      throttled
      # Helpful additions to LeftWM
      polybarFull
      picom
      dunst
      feh
      rofi
      pavucontrol
      pcmanfm
      gvfs
      flameshot
      xcolor
      # Theming
      materia-theme
      qogir-icon-theme
      lxappearance
      # Java PLEASE
      jdk17
      # For stress testing
      # mprime
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

  # Fonts with JetBrainsMono Nerd please
  fonts.packages = with pkgs; [
    liberation_ttf
    font-awesome
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    twitter-color-emoji
  ];

  # Some programs
  programs.nm-applet.enable = true;

  # LeftWM
  services.xserver = {
    enable = true;
    libinput.enable = true;
    windowManager.leftwm.enable = true;
    displayManager.lightdm.enable = true;
    layout = "us";
    xkbVariant = "altgr-intl";
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

  # Docker
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker;
  };

  # Rofi Greenclip
  services.greenclip = {
    enable = true;
    package = pkgs.haskellPackages.greenclip;
  };

  # Throttled
  #services.throttled.enable = true;

  # Enable Bluetooth
  #hardware.bluetooth.enable = true;
  #services.blueman.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  system.stateVersion = "23.11";

}
