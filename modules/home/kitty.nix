{ ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      confirm_os_window_close 0
    '';
    theme = "Dark Pride";
    font.name = "Hack Nerd Font";
  };
}
