{ config, lib, ... }:

{
    services.xserver = {
        enable = true;
        libinput.enable = true;
        windowManager.leftwm.enable = true;
        layout = "us";
        xkbVariant = "altgr-intl";
        desktopManager.xterm.enable = false;
        desktopManager.xfce = {
            enable = true;
            enableXfwm = true;
        };
    };
}
