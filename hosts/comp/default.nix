{ lib, ... }:

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
    };
    
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    # Setup keyfile
    initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };

    initrd.systemd.enable = true;

    resumeDevice = "/dev/mapper/swap";

    initrd.luks.devices."swap".device = "/dev/disk/by-uuid/adde261c-328c-45c4-af26-fb526a7d1533";

    bootspec.enable = true;

    # Install wireless driver for rtw89
  };

  programs = {
    wireshark.enable = true;
    light.enable = true;
    ssh.startAgent = true;
  };

  services = {
    hostapd = {
      enable = false;
      interface = "wlo1";
      channel = 36;
      wpaPassphrase = "Spidoulebest";
      ssid = "Le wifi des ACUs";
      hwMode = "a";
      extraConfig = ''
        ctrl_interface=/var/run/hostapd
        ctrl_interface_group=0

        country_code=FR
        ieee80211d=1

        ieee80211n=1
        ht_capab=[MAX-AMSDU-7935][HT40+][SHORT-GI-20][SHORT-GI-40][DSSS_CCK-40]

        ieee80211ac=1
        vht_capab=[SHORT-GI-80][MU-BEAMFORMEE]

        vht_oper_chwidth=1
        vht_oper_centr_freq_seg0_idx=42
      '';
    };
  };

  
}