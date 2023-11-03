{ pkgs, ... }:
# Fusuma configuration for touchpad gesture
{
  services.fusuma = {
    enable = true;
    extraPackages = with pkgs; [ coreutils-full xdotool ];
    settings = {
      threshold = {
        swipe = 0.1;
      };
      interval = {
        swipe = 0.8;
      };
      swipe = {
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
