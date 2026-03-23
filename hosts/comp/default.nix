{ pkgs, lib, lanzaboote, ... }:

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
      systemd-boot.enable = lib.mkForce false;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
      };

    };

    # Setup keyfile
    initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };

    initrd.systemd.enable = true;

    resumeDevice = "/dev/mapper/swap";

    initrd.luks.devices."swap".device = "/dev/disk/by-uuid/adde261c-328c-45c4-af26-fb526a7d1533";

    bootspec.enable = true;
    bootspec.package = lanzaboote;
  };

  programs = {
    wireshark.enable = true;
    light.enable = true;
    ssh.startAgent = true;
    steam.enable = true;
  };

  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
