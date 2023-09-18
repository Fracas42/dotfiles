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
    postman

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

    #Git
    gitkraken
    
    #Games
    prismlauncher
    starsector

    #Utils
    xclip
    maim
    wget

    #Others
    chatterino2
    authy
    vlc
    nil
    parsec-gaming
    direnv

    #Network
    ciscoPacketTracer8
    inetutils
  ];
}