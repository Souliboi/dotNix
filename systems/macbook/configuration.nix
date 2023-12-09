{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../configs/cpu-freq.nix
    ../../configs/leftwm.nix
    ../../configs/packages.nix
    ./configs/lock.nix
  ];
  # Optimise and clean up
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "-d --delete-older-than 5d";
  };
  

  # Grub & boot configuration
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "udev.log_level=3" ];
  boot.blacklistedKernelModules = [
    "amdgpu"
    "radeon"
  ];
  boot.kernelModules = [
    "hid_apple"
  ];
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 10;
      gfxmodeEfi = "1680x1050";
      extraConfig = ''
        terminal_input --append console
    	terminal_output --append console
      '';
    };
  };

  # Network
  networking = {
    hostName = "NixBook";
    networkmanager.enable = true;
    enableB43Firmware = true;
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
  # nixpkgs.config.allowUnfree = true;

  # Nushell
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    acpilight
    wget
    git
    gcc_multi
    rustup
    python3
    go
    # pactl
    pulseaudio
  ];

  # Fonts with JetBrainsMono Nerd please
  fonts.packages = with pkgs; [
    liberation_ttf
    font-awesome
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    twitter-color-emoji
  ];

  # Some programs
  programs = { 
    nm-applet.enable = true;
    zsh.enable = true;
    starship.enable = true;
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

  # Polkit
  security.polkit.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
	ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
	Restart = "on-failure";
	RestartSec = 1;
	TimeoutStopSec = 10;
      };
    };
  };

  # thermald
  services.thermald.enable = true;

  # XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
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
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  # Acpilight
  hardware.acpilight.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  system.stateVersion = "23.11";

}
