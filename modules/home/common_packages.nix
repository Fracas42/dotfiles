{ pkgs, pkgs-stable, pkgs-lastest, ... }:
# Packages to install
let
  parsec-gaming = pkgs.callPackage ../pkgs/parsecd.nix { };
in
{
  home.packages = with pkgs; [
    # Browser
    firefox
    pkgs-lastest.google-chrome

    #IDE
    vim
    jetbrains.idea-ultimate

    #Frameworks
    pkgs-stable.wireshark

    #Com
    discord
    slack
    tdesktop
    thunderbird

    #CLI
    tree
    wget
    nixpkgs-fmt
    clang-tools
    gdb
    unzip
    man-pages

    #Git
    gitkraken

    #Games
    prismlauncher
    starsector

    #Utils
    xclip
    wget

    #Others
    chatterino2
    authy
    vlc
    nil
    parsec-gaming
    anydesk
    direnv
    nerdfonts
    virt-manager

    #Network
    ciscoPacketTracer8
    inetutils
  ];
}
