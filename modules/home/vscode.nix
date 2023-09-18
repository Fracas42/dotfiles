{ pkgs, vscode-extensions, ... }:
# VSCode config

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with vscode-extensions.vscode-marketplace; [
      vscode-extensions.vscode-marketplace."4ops".terraform
      arrterian.nix-env-selector
      cbasdev.dracula-purple
      eamodio.gitlens
      jnoortheen.nix-ide
      kevinrose.vsc-python-indent
      laurenclark.sappho
      maelvalais.autoconf
      mkhl.direnv
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
      ms-vscode.remote-explorer
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      llvm-vs-code-extensions.vscode-clangd
      orta.vscode-jest
      pinage404.nix-extension-pack
      pranaygp.vscode-css-peek
      rust-lang.rust-analyzer
      twxs.cmake
      visualstudioexptteam.intellicode-api-usage-examples
      visualstudioexptteam.vscodeintellicode
      webfreak.debug
      xaver.clang-format
    ];
  };
}
