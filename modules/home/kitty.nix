{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      confirm_os_window_close 0
    '';
    themeFile = "dark_pride";
    font.name = "Hack Nerd Font";
  };
}
