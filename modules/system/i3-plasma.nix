{ pkgs, username, ... }:
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
              env ${pkgs.plasma-workspace}/bin/startplasma-x11
            '';
          }
        ];
      };
      desktopManager.plasma5.enable = true;
      windowManager.i3.enable = true;
      videoDrivers = [ "amdgpu" ];
    };
  };

  systemd.user.services = {
    i3 = {
      description = "i3 for Plasma via systemd";
      before = [ "plasma-workspace-x11.target" ];
      wantedBy = [ "plasma-workspace-x11.target" ];

      serviceConfig = 
      {
        ExecStart="%h/.nix-profile/bin/i3";
        ExecReload="%h/.nix-profile/bin/i3-msg reload";
        Restart = "on-failure";
      };

      path = [
        "/run/wrappers"
        "/home/${username}/.nix-profile"
        "/etc/profiles/per-user/${username}"
        "/nix/var/nix/profiles/default"
        "/run/current-system/sw"
      ];
    };
  };

  systemd.user.services.plasma-kwin_x11.enable = false;
}