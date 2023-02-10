{ config, pkgs, ... }:
# Fracas Laptop configuration
{
  imports = [
    # packages
    ../../modules/home/common_packages.nix
    # apps
    ../../modules/home/git.nix
    # services
    (import ../../modules/home/i3-plasma.nix { modifier = "Mod4"; })
    ../../modules/home/fusuma.nix
  ];

  home.username = "fracas";
  home.homeDirectory = "/home/fracas";

  home.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    bash.enable = true;
  };

  xresources.properties = {
    "Xft.dpi" = 120;
  };
}