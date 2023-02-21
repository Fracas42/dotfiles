{ config, pkgs, ... }:
# Packages to install
{
  home.packages = with pkgs; [
    # Browser
    firefox
    google-chrome

    #IDE
    vim
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
    gcc
    gdb

    #Git
    gitkraken
    
    #Games
    prismlauncher

    #Utils
    xdotool
    xclip
    imagemagick
    cmake

    #Others
    chatterino2
    teams
    wireshark
  ];

  home.sessionVariables = {
    # for c++ and libmagic (in that order)
    LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.file}/lib";
  };
}