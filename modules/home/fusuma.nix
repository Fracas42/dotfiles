{ pkgs, pkgs-lastest, ... }:
# Fusuma configuration for touchpad gesture
{
  services.fusuma = {
    enable = true;
    extraPackages = with pkgs-lastest; [ coreutils-full xdotool xorg.xprop ];
    package = pkgs-lastest.fusuma;
    settings = {
      threshold = {
        swipe = 0.1;
      };
      interval = {
        swipe = 0.8;
      };
      swipe = {
        "3" = {
          left = { command = "exec ${pkgs.i3-gaps}/bin/i3 focus left"; };
          right = { command = "exec ${pkgs.i3-gaps}/bin/i3 focus right"; };
        };
        "4" = {
          left = { command = "exec ${pkgs.i3-gaps}/bin/i3 workspace prev"; };
          right = { command = "exec ${pkgs.i3-gaps}/bin/i3 workspace next"; };
          up = { command = "exec ${pkgs.i3-gaps}/bin/i3 fullscreen toggle"; };
          down = { command = "exec ${pkgs.i3-gaps}/bin/i3 floating toggle"; };
        };
      };
    };
  };
}
