{ config, lib, ... }:

{
    services.physlock = {
            enable = true;
            lockOn = {
                suspend = true;
                hibernate = true;
                extraTargets = [ "display-manager.service" ];
            };
            disableSysRq = true;
    };
}
