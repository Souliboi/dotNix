{ config, pkgs, ...}:

{
    users.users.soul = {
        description = "Soul";
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" "video" ];
        packages = with pkgs; [
            # Core Packages
            neofetch
            wezterm
            alacritty
            zellij
            btop
            firefox
            libreoffice-fresh
            starship
            (discord.override {
                withOpenASAR = true;
                withVencord = true;
            })
            eza
            vscode-fhs
            # LeftWM Packages
            polybarFull
            picom
            feh
            rofi
            pavucontrol
            gvfs
            flameshot
            xcolor
            xclip
            # Theme
            lxappearance
            # Neovim Packages
            neovim
            ripgrep
            lua-language-server
            nil
            gopls
            # Codeberg & GitHub
            codeberg-cli
            gh
            # Xfce4
            xfce.xfce4-notifyd
            xfce.xfce4-pulseaudio-plugin
        ];
    };
}
