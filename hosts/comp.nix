{ system, inputs, location, lib, pkgs, ... }:
# Configuration for fracas laptop
let
  host = {
    hostName = "fracas";
    mainMonitor = "eDP";
  };

in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit host inputs location system;
  };

  modules = [
    ./comp
    ./configuration.nix
  ];
}