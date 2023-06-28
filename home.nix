{ inputs, pkgs, pkgs-stable, pkgs-lastest, vscode-extensions, ... }:
let
  mkHome = modules:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs modules;
      extraSpecialArgs = {
        inherit pkgs-stable pkgs-lastest vscode-extensions;
      };
    };
in
{
  fracas = mkHome [ ./hosts/comp/home.nix ];
}
