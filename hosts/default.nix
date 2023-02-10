
{ inputs, location, lib, pkgs, system, ... }:

{
  fracas = import ./comp.nix { inherit system inputs location lib pkgs; };
}