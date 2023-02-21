{ config, pkgs, ... }:
# VSCode config

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
  };
}
