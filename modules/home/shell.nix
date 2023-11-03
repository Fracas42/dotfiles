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
      enableAliases = true;
      git = true;
      icons = true;
    };
    bat.enable = true;
  };

  home.shellAliases = {
    g = "git";
  };
}
