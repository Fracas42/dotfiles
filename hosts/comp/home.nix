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
    ../../modules/home/picom.nix
    ../../modules/home/shell.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;

  home.file.".face.icon" = 
  {
    source = ../../assets/pfp/pfp-512x512.png;
    target = ".face.icon";
  };

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xresources.properties = {
    "Xft.dpi" = 120;
  };

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  programs = {
    browserpass = {
      enable = true;
      browsers = [ "chrome" ];
    };
    password-store = {
      enable = true;
    };
    gpg.enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };
}
