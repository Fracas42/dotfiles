{ inputs, location, lib, pkgs-stable, pkgs-unstable, system, lanzaboote, ... }:

{
  fracas = import ./comp.nix { inherit system inputs location lib pkgs-stable pkgs-unstable lanzaboote; };
}
