{ ... }:

{
  services.picom = {
    enable = true;

    opacityRules = [
      "90:class_g = 'kitty'"
    ];
  };
}
