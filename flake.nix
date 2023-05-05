{
  description = "Fracas nixos configuration, inspired from baptnix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-lastest.url = "github:nixos/nixpkgs/master";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-22.11";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, nixpkgs-lastest, home-manager, nix-vscode-extensions }@inputs:
    let
      system = "x86_64-linux";

      lib = nixpkgs.lib;

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-lastest = import nixpkgs-lastest {
        inherit system;
        config.allowUnfree = true;
      };

      vscode-extensions = inputs.nix-vscode-extensions.extensions."${system}";

      location = "$HOME/.config/nixpkgs";
    in
    {
      nixosConfigurations = import ./hosts {
        inherit inputs location lib system pkgs-stable;
        pkgs-unstable = pkgs;
      };

      homeConfigurations = import ./home.nix { inherit inputs lib pkgs pkgs-stable pkgs-lastest system vscode-extensions; };
    };
}
