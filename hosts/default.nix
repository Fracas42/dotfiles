
{ inputs, location, lib, pkgs-stable, pkgs-unstable, system, ... }:

{
  fracas = import ./comp.nix { inherit system inputs location lib pkgs-stable pkgs-unstable; };
}