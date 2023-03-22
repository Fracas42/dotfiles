{ config, pkgs, pkgs-stable, pkgs-lastest, ... }:
# Packages to install
{
  home.packages = with pkgs; [
    # Browser
    firefox
    pkgs-lastest.google-chrome

    #IDE
    vim
    jetbrains.idea-ultimate

    #Com
    discord
    slack

    #Term
    pkgs-stable.kitty

    #CLI
    tree
    wget
    nixpkgs-fmt
    clang-tools
    gdb

    #Git
    gitkraken
    
    #Games
    prismlauncher
    starsector

    #Utils
    xdotool
    xclip
    imagemagick

    #Others
    chatterino2
    wireshark
    authy
    vlc
  ];
}