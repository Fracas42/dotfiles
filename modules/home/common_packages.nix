{ pkgs, pkgs-stable, pkgs-lastest, ... }:
# Packages to install
let
in
{
  home.packages = with pkgs; [
    # Browser
    firefox
    pkgs-lastest.google-chrome

    #IDE
    vim

    #Frameworks
    pkgs-stable.wireshark

    #Com
    discord
    telegram-desktop
    thunderbird

    #CLI
    tree
    wget
    nixpkgs-fmt
    clang-tools
    gdb
    unzip
    man-pages
    nix-index

    #Games
    prismlauncher
    starsector

    #Utils
    xclip
    wget

    #Others
    chatterino2
    vlc
    nil
    parsec-bin
    anydesk
    direnv
    virt-manager

    #Network
    inetutils
  ];
}
