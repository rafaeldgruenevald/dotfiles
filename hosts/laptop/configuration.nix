# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan.
    ../common.nix
    ../.././modules/nixos/prog.nix
    ../.././modules/nixos/intel.nix
    ../.././modules/nixos/sway.nix
    ../.././modules/nixos/programs.nix
    ../.././modules/nixos/virtualization.nix # add more stuff
    ../.././modules/nixos/emacs.nix
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "laptop";

  networking.firewall.allowedTCPPorts = [
    4242
    1883
    9001
  ];
  networking.firewall.allowedUDPPorts = [
    4242
    1883
    9001
  ];

  users.users.rafaeldg = {
    isNormalUser = true;
    description = "Rafael Delazeri Gruenevald";

    extraGroups = [
      "networkmanager"
      "syncthing"
      "libvirtd"
      "dialout"
      "wheel"
      "uucp"
      "tty"
    ];
    packages = with pkgs; [
      dconf
      spotify
      discord
      obsidian
      libreoffice
    ];
  };

  specialisation = {
    # All my stuff
    "full".configuration = {
      environment.etc."specialisation".text = "full";
      system.nixos.tags = [ "full" ];

      # Turning off stuff from minimal setup
      services.greetd.enable = lib.mkForce false;
      services.blueman.enable = lib.mkForce false;

      imports = [
        ../.././modules/nixos/gnome.nix
      ];
      services.flatpak.packages = [
        "com.github.tchx84.Flatseal"
        "com.mattjakeman.ExtensionManager"
        "com.stremio.Stremio"
        "ch.tlaun.TL"
      ];
      users.users.rafaeldg.packages = with pkgs; [
        lutris
      ];
      programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
      programs.gamemode.enable = true;
    };
  };

  # Home-Manager
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit (config.system.nixos) tags;
    };
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
