{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "intl";
      displayManager = {
        defaultSession = "plasma5+i3";
        gdm.enable = true;
        session = [
          {
            manage = "desktop";
            name = "plasma5+i3";
            start = ''
              env KDEWM=${pkgs.i3-gaps}/bin/i3 ${pkgs.plasma-workspace}/bin/startplasma-x11
            '';
          }
        ];
      };
      desktopManager.plasma5.enable = true;
      windowManager.i3.enable = true;
    };
  };
}