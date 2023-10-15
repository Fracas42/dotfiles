{...}:

{
  services.picom = {
    enable = true;
    fade = true;
    fadeDelta = 5;
    fadeSteps = [ 0.05 0.05 ];

    opacityRules = [
      "90:class_g = 'kitty'"
    ];
  };
}