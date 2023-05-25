{ config, pkgs, vscode-extensions, ... }:
# VSCode config

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with vscode-extensions.vscode-marketplace; [
      cbasdev.dracula-purple
      eamodio.gitlens
      jnoortheen.nix-ide
      kevinrose.vsc-python-indent
      kurojifusky.majira-strawberry-vscode
      laurenclark.sappho
      maelvalais.autoconf
      ms-python.isort
      ms-python.python
      ms-python.vscode-pylance
      ms-toolsai.jupyter
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
      ms-toolsai.vscode-jupyter-cell-tags
      ms-toolsai.vscode-jupyter-slideshow
      ms-vscode.cmake-tools
      ms-vscode.makefile-tools
      llvm-vs-code-extensions.vscode-clangd
      orta.vscode-jest
      rust-lang.rust-analyzer
      twxs.cmake
      visualstudioexptteam.intellicode-api-usage-examples
      visualstudioexptteam.vscodeintellicode
      webfreak.debug
      xaver.clang-format
    ];
  };
}
