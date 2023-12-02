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
            btop
            firefox
            discord
            libreoffice-fresh
            starship
            # LeftWM Packages
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
            # lock
            i3lock
        ];
    };
}
