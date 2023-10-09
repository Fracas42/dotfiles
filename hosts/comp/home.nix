{ pkgs-stable, username, ... }:
# Fracas Laptop configuration
{
  imports = [
    # packages
    ../../modules/home/common_packages.nix
    # apps
    ../../modules/home/git.nix
    ../../modules/home/vscode.nix
    # services
    (import ../../modules/home/i3-plasma.nix { modifier = "Mod4"; pkgs = pkgs-stable; })
    ../../modules/home/fusuma.nix
    ../../modules/home/kitty.nix
    ../../modules/home/sym_link_config.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

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

  home.shellAliases = {
    g = "git";
  };
}
