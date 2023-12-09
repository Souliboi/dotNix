{ config, lib, ... }:

{
    # LeftWM
    services.xserver = {
        enable = true;
        libinput.enable = true;
        windowManager.leftwm.enable = true;
        layout = "us";
        xkbVariant = "altgr-intl";
    };
}
