{ username, pkgs, config, ... }:

let
  git_assets_path = "/home/${username}/.config/nixpkgs/assets";

  files = [
    #VSCode
    ".config/Code/User/keybindings.json"
    ".config/Code/User/settings.json"

    # KDE / Plasma
    ".config/plasma-org.kde.plasma.desktop-appletsrc"
    ".config/plasmanotifyrc"
    ".config/plasmashellrc"
    ".config/kdeglobals"
  ];

  links = pkgs.lib.lists.forEach files (file:
    {
      name = "${file}";
      value = {
        target = "${file}";
        source = config.lib.file.mkOutOfStoreSymlink "${git_assets_path}/${file}";
      };
    }
  );
in
{
  home.file = builtins.listToAttrs links;
}
