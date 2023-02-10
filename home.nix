
{ inputs, lib, pkgs, system, ... }:
let
  mkHome = modules:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs modules;
    };
in
{
  fracas = mkHome [ ./hosts/comp/home.nix ];
}