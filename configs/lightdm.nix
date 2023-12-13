{config, lib, ... }:

{
    services.xserver.displayManager.lightdm = {
        enable = true;
        background = "/home/soul/Pictures/background.png";
        greeters.gtk = {
            enable = true;
        };
    };
}
