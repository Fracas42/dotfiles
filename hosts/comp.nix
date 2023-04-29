{ system, inputs, location, lib, pkgs-stable, pkgs-unstable, ... }:
# Configuration for fracas laptop
let
  host = {
    hostName = "fracas";
    mainMonitor = "eDP";
  };

in
inputs.nixpkgs-stable.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit host inputs location system pkgs-stable pkgs-unstable;
  };

  modules = [
    ./comp
    ./configuration.nix
  ];
}