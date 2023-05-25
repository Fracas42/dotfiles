{ config, pkgs, user, ... }:

let
  rtw89 = import ../../modules/system/rtw89.nix { inherit config pkgs; } ;
in
{
  imports = [
    ../../../../../../etc/nixos/hardware-configuration.nix
    # services
    ../../modules/system/i3-plasma.nix
    ../../modules/system/bluetooth.nix
  ];

  networking.hostName = "fracas";

  boot = {
    # Bootloader.
    loader = {
      systemd-boot.enable = true;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };

    # Setup keyfile
    initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };

    initrd.systemd.enable = true;

    resumeDevice = "/dev/mapper/swap";

    initrd.luks.devices."swap".device = "/dev/disk/by-uuid/adde261c-328c-45c4-af26-fb526a7d1533";

    # Install wireless driver for rtw89
    extraModulePackages = [ rtw89 ];
  };

  programs = {
    wireshark.enable = true;
    light.enable = true;
  };
}