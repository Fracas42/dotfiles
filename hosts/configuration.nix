{ inputs, pkgs, system, pkgs-unstable, ... }:

{
  imports = [ ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fracas = {
    isNormalUser = true;
    description = "Fracas";
    extraGroups = [ "networkmanager" "wheel" "video" "docker" "input" "wireshark" ];
  };

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  security.sudo.wheelNeedsPassword = false;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall = {
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; }
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; }
    ];
  };

  time = {
    # Set your time zone.
    timeZone = "Europe/Paris";
    # Use local time instead of UTC for dualboot compatibility
    hardwareClockInLocalTime = true;
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  services = {

    xserver = {
      # Enable the X11 windowing system.
      enable = true;

      # Configure keymap in X11
      layout = "us";
      xkbVariant = "intl";

      # Enable touchpad support
      libinput.enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Enable CUPS to print documents.
    printing.enable = true;
  };

  environment = {
    # Environment variables
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
      PAGER = "less";
    };
    systemPackages = [
      inputs.home-manager.defaultPackage.${system}
    ];
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
    # Nix Package Manager settings
    settings = {
      auto-optimise-store = true;
    };

    # Garbage collector settings
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # Enable nixFlakes on system
    registry.nixpkgs.flake = inputs.nixpkgs;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  virtualisation = {
    docker.enable = true;
    virtualbox.host.enable = true;
  };

  system = {
    stateVersion = "23.11";
    autoUpgrade.enable = true;
    autoUpgrade.allowReboot = true;
  };

  swapDevices = [{ device = "/dev/mapper/swap"; }];

  services.logind.lidSwitch = "suspend-then-hibernate";
  systemd.sleep.extraConfig = "HibernateDelaySec=1h";
}
