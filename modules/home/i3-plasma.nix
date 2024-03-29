{ modifier, pkgs }:
# I3 configuration
#
# Args:
# - modifier: i3 modifier
#
{ config, ... }:
# I3 configuration to use with KDE
{
  xsession.enable = true;

  # Disable the command set by the i3 service of home manager
  xsession.windowManager.command = pkgs.lib.mkForce ''test -n "$1" && eval "$@"'';

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      colors = {
        focused = { border = "#010101"; childBorder = "#010101"; background = "#13b019"; text = "#80FFF9"; indicator = "#08D19F"; };
        focusedInactive = { border = "#032D42"; childBorder = "#032D42"; background = "#032D42"; text = "#1ABC9C"; indicator = "#454948"; };
        unfocused = { border = "#032D42"; childBorder = "#032D42"; background = "#032D42"; text = "#1ABC9C"; indicator = "#454948"; };
        urgent = { border = "#CB4B16"; childBorder = "#CB4B16"; background = "#FDF6E3"; text = "#1ABC9C"; indicator = "#268BD2"; };
        placeholder = { border = "#000000"; childBorder = "#000000"; background = "#0c0c0c"; text = "#ffffff"; indicator = "#000000"; };

        background = "#000000";
      };

      inherit modifier;

      floating.border = 1;

      gaps = {
        inner = 14;
        outer = -2;
        smartBorders = "on";
      };

      assigns = {
        "9" = [{ class = "^discord$"; }];
        "10" = [{ class = "^Slack$"; }];
      };

      keybindings = pkgs.lib.mkOptionDefault {
        # Borders
        "${modifier}+u" = "border none";
        "${modifier}+n" = "border pixel 1";

        # Programs
        "${modifier}+Return" = "exec kitty";
        "${modifier}+Shift+e" = "exec --no-startup-id qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout -1 -1 -1";
        "${modifier}+Escape" = "exec --no-startup-id /bin/sh -c 'sleep 0.5 && qdbus org.kde.kglobalaccel /component/ksmserver invokeShortcut \"Lock Session\"'";

        # Utils
        "${modifier}+Shift+q" = "kill";
        "Print" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/org_kde_spectacle_desktop org.kde.kglobalaccel.Component.invokeShortcut RectangularRegionScreenShot";
        "Shift+Print" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/org_kde_spectacle_desktop org.kde.kglobalaccel.Component.invokeShortcut FullScreenScreenShot";

        # Focus
        "${modifier}+j" = "focus left";
        "${modifier}+k" = "focus down";
        "${modifier}+l" = "focus up";
        "${modifier}+semicolon" = "focus right";

        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";

        "${modifier}+a" = "focus parent";
        "${modifier}+Shift+a" = "focus child";
        "${modifier}+space" = "focus mode_toggle";

        # Move container
        "${modifier}+Shift+j" = "move left";
        "${modifier}+Shift+k" = "move down";
        "${modifier}+Shift+l" = "move up";
        "${modifier}+Shift+semicolon" = "move right";

        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        # Split
        "${modifier}+h" = "split h;exec notify-send 'tile horizontally'";
        "${modifier}+v" = "split v;exec notify-send 'tile vertically'";
        "${modifier}+q" = "split toggle";

        # Layout
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        # Windows mode toggles
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+Shift+s" = "sticky toggle";


        # Workspaces

        ## Switch workspace
        "${modifier}+0" = "workspace 10";
        "${modifier}+1" = "workspace 1";
        "${modifier}+2" = "workspace 2";
        "${modifier}+3" = "workspace 3";
        "${modifier}+4" = "workspace 4";
        "${modifier}+5" = "workspace 5";
        "${modifier}+6" = "workspace 6";
        "${modifier}+7" = "workspace 7";
        "${modifier}+8" = "workspace 8";
        "${modifier}+9" = "workspace 9";

        "${modifier}+Ctrl+0" = "workspace 20";
        "${modifier}+Ctrl+1" = "workspace 11";
        "${modifier}+Ctrl+2" = "workspace 12";
        "${modifier}+Ctrl+3" = "workspace 13";
        "${modifier}+Ctrl+4" = "workspace 14";
        "${modifier}+Ctrl+5" = "workspace 15";
        "${modifier}+Ctrl+6" = "workspace 16";
        "${modifier}+Ctrl+7" = "workspace 17";
        "${modifier}+Ctrl+8" = "workspace 18";
        "${modifier}+Ctrl+9" = "workspace 19";

        "${modifier}+Ctrl+Right" = "workspace next";
        "${modifier}+Ctrl+Left" = "workspace prev";
        "${modifier}+b" = "workspace back_and_forth";
        "${modifier}+Shift+b" = "move container to workspace back_and_forth; workspace back_and_forth";

        ## Move container to workspace and switch workspace
        "${modifier}+Shift+0" = "move container to workspace 10; workspace 10";
        "${modifier}+Shift+1" = "move container to workspace 1; workspace 1";
        "${modifier}+Shift+2" = "move container to workspace 2; workspace 2";
        "${modifier}+Shift+3" = "move container to workspace 3; workspace 3";
        "${modifier}+Shift+4" = "move container to workspace 4; workspace 4";
        "${modifier}+Shift+5" = "move container to workspace 5; workspace 5";
        "${modifier}+Shift+6" = "move container to workspace 6; workspace 6";
        "${modifier}+Shift+7" = "move container to workspace 7; workspace 7";
        "${modifier}+Shift+8" = "move container to workspace 8; workspace 8";
        "${modifier}+Shift+9" = "move container to workspace 9; workspace 9";

        "${modifier}+Ctrl+Shift+0" = "move container to workspace 20; workspace 20";
        "${modifier}+Ctrl+Shift+1" = "move container to workspace 11; workspace 11";
        "${modifier}+Ctrl+Shift+2" = "move container to workspace 12; workspace 12";
        "${modifier}+Ctrl+Shift+3" = "move container to workspace 13; workspace 13";
        "${modifier}+Ctrl+Shift+4" = "move container to workspace 14; workspace 14";
        "${modifier}+Ctrl+Shift+5" = "move container to workspace 15; workspace 15";
        "${modifier}+Ctrl+Shift+6" = "move container to workspace 16; workspace 16";
        "${modifier}+Ctrl+Shift+7" = "move container to workspace 17; workspace 17";
        "${modifier}+Ctrl+Shift+8" = "move container to workspace 18; workspace 18";
        "${modifier}+Ctrl+Shift+9" = "move container to workspace 19; workspace 19";

        "${modifier}+ctrl+r" = "move workspace to output next";

        # Modes
        "${modifier}+r" = ''mode "resize"'';
      };

      workspaceAutoBackAndForth = true;

      menu = "--no-startup-id qdbus org.kde.krunner /App display";

      defaultWorkspace = "workspace 1";

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ${../../assets/wallpapers/silly-blep-wallpaper.png}";
          always = true;
          notification = false;
        }
        {
          command = ''pkill "ksplashqml"'';
          always = true;
          notification = false;
        }
      ];

      bars = [ ];

      terminal = "kitty";

      modes.resize = pkgs.lib.mkOptionDefault {
        "Escape" = "mode default";
        "Return" = "mode default";
        "${modifier}+r" = "mode default";

        "j" = "resize shrink width 5 px or 5 ppt";
        "k" = "resize grow height 5 px or 5 ppt";
        "l" = "resize shrink height 5 px or 5 ppt";
        "semicolon" = "resize grow width 5 px or 5 ppt";

        "Left" = "resize shrink width 10 px or 10 ppt";
        "Down" = "resize grow height 10 px or 10 ppt";
        "Up" = "resize shrink height 10 px or 10 ppt";
        "Right" = "resize grow width 10 px or 10 ppt";

        "Shift+j" = "resize shrink width 1 px or 1 ppt";
        "Shift+k" = "resize grow height 1 px or 1 ppt";
        "Shift+l" = "resize shrink height 1 px or 1 ppt";
        "Shift+semicolon" = "resize grow width 1 px or 1 ppt";

        "Shift+Left" = "resize shrink width 1 px or 1 ppt";
        "Shift+Down" = "resize grow height 1 px or 1 ppt";
        "Shift+Up" = "resize shrink height 1 px or 1 ppt";
        "Shift+Right" = "resize grow width 1 px or 1 ppt";
      };
    };

    extraConfig = ''
      ###############################################################################
      ## Plasma windows configurations                                             ##
      ###############################################################################
      for_window [class="Galculator"] floating enable border pixel 1
      for_window [class="GParted"] floating enable border pixel 1
      for_window [title="i3_help"] floating enable sticky enable border pixel 1
      for_window [class="Nitrogen"] floating enable sticky enable border pixel 1
      for_window [class="qt5ct"] floating enable sticky enable border pixel 1
      for_window [class="Qtconfig-qt4"] floating enable sticky enable border pixel 1
      for_window [class="Simple-scan"] floating enable border pixel 1
      for_window [window_role="pop-up"] floating enable
      for_window [window_role="task_dialog"] floating enable
      for_window [class="yakuake"] floating enable
      for_window [class="systemsettings"] floating enable
      for_window [class="plasmashell"] floating enable;
      for_window [class="Plasma"] floating enable; border none
      for_window [class="Conky"] floating enable; border none
      for_window [title="plasma-desktop"] floating enable; border none
      for_window [title="win7"] floating enable; border none
      for_window [class="krunner"] floating enable; border none
      for_window [class="Kmix"] floating enable; border none
      for_window [class="Klipper"] floating enable; border none
      for_window [class="Plasmoidviewer"] floating enable; border none
      for_window [class="plasmashell" window_type="notification"] border none, move right 700px, move down 450px
      for_window [class="plasmashell" window_type="dialog"] floating enable, border pixel 1, resize set 400 300
      no_focus [class="plasmashell" window_type="notification"]
      for_window [title="Desktop — Plasma"] kill; border pixel 1
      for_window [class="ksplashqml"] kill; border pixel 1
      for_window [class="kscreen_osd_service"] floating enable; border none
      for_window [title="Desktop @ QRect"] kill; floating enable; border none
    '';
  };
}
