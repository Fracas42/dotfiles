{ ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
    # Nix Package Manager settings
    settings = {
      auto-optimise-store = true;
    };

    # Garbage collector settings
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # Enable nixFlakes on system
    registry.nixpkgs.flake = inputs.nixpkgs;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
