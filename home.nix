
{ inputs, lib, pkgs, pkgs-stable, pkgs-lastest, system, ... }:
let
  mkHome = modules:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs modules;
      extraSpecialArgs = {
        inherit pkgs-stable pkgs-lastest;
      };
    };
in
{
  fracas = mkHome [ ./hosts/comp/home.nix ] ;
}