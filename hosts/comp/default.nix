{ config, pkgs, user, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
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

    # Install wireless driver for rtw89
    extraModulePackages = [ config.boot.kernelPackages.rtw89 ];
  };

  programs = {
    wireshark.enable = true;
    light.enable = true;
  };
}