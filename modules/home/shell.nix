{ ... }:

{
  programs = {
    bash = {
      enable = true;
      historyControl = [ "erasedups" ];
      bashrcExtra = ''
        shopt -s histappend
      '';
    };
    eza = {
      enable = true;
      git = true;
      icons = "auto";
    };
    bat.enable = true;
  };

  home.shellAliases = {
    g = "git";
  };
}
