{ config, pkgs, ... }:
# Packages to install
{
  home.packages = with pkgs; [
    # Browser
    firefox
    google-chrome

    #IDE
    vim
    vscodium
    jetbrains.idea-ultimate

    #Com
    discord
    slack

    #Term
    kitty

    #CLI
    tree
    wget
    nixpkgs-fmt
    clang-tools

    #Git
    gitkraken
    
    #Games
    prismlauncher

    #Utils
    xdotool
    xclip
    imagemagick

    #Others
    chatterino2
    teams
    wireshark
  ];
}