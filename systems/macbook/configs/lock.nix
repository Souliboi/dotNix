{ config, lib, pkgs, ... }:

{
    servics.xserver.xautolock = {
            enable = true;
            time = 10;
            killer = "/run/current-system/systemd/bin/systemctl suspend";
            killtime = 20;
            extraOptions = [ "-detectsleep" ];
            locker = "${pkgs.i3lock}/bin/i3lock -i /home/soul/Pictures/wallpapers/background.png}";
        };
}
