{ inputs, pkgs, pkgs-stable, pkgs-lastest, vscode-extensions, username, ... }:
let
  mkHome = modules:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs modules;
      extraSpecialArgs = {
        inherit pkgs-stable pkgs-lastest vscode-extensions username;
      };
    };
in
{
  fracas = mkHome [ ./hosts/comp/home.nix ];
}
