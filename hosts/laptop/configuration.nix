# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan.
    ../.././modules/nixos/fonts.nix
    ../.././modules/nixos/prog.nix
    ../.././modules/nixos/emacs.nix
    ../.././modules/nixos/intel.nix
    ../.././modules/nixos/gnome.nix
    ../.././modules/nixos/stylix.nix
    ../.././modules/nixos/portals.nix
    ../.././modules/nixos/programs.nix
    ../.././modules/nixos/services.nix
    ../.././modules/nixos/virtualization.nix
    inputs.home-manager.nixosModules.default
  ];

  boot = {
    # Kernel
    kernelPackages = pkgs.linuxPackages_zen;

    # Bootloader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=1
      options snd-hda-intel model=alc256-samsung-headphone
    '';

    plymouth.enable = true;
  };

  # Enable Nix Flakes
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    /*
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    */
  };

  networking.hostName = "laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Syncthing ports: 8384 for remote access to GUI
  # 22000 TCP and/or UDP for sync traffic
  # 21027/UDP for discovery
  # source: https://docs.syncthing.net/users/firewall.html
  networking.firewall.allowedTCPPorts = [
    4242
  ];
  networking.firewall.allowedUDPPorts = [
    4242
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  # Bluetooth Support
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  hardware.enableAllFirmware = true;

  # Security
  security.rtkit.enable = true;

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rafaeldg = {
    isNormalUser = true;
    description = "Rafael Delazeri Gruenevald";

    extraGroups = [
      "networkmanager"
      "syncthing"
      "wheel"
    ];
    packages = with pkgs; [
      mpv
      dconf
      sioyek
      stremio
      discord
      zathura
      obsidian
      koreader
      alacritty
      fragments
      parsec-bin
      thunderbird
      pavucontrol
      libreoffice
    ];
  };

  # Home-Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "rafaeldg" = import ./home.nix;
    };
    backupFileExtension =
      "backup-"
      + pkgs.lib.readFile "${pkgs.runCommand "timestamp" { } "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
