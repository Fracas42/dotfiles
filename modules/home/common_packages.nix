{ pkgs, pkgs-stable, pkgs-lastest, ... }:
# Packages to install
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
    xclip
    maim
    wget

    #Others
    chatterino2
    authy
    vlc
    nil

    #Network
    ciscoPacketTracer8
  ];
}