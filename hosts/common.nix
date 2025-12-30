{
  config,
  pkgs,
  inputs,
  ...
}:

{
  boot = {
    # Kernel
    kernelPackages = pkgs.linuxPackages_zen;

    # Bootloader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    /*
        CHECAR AUDIO PORT PRA VER SE TA FUNCIONANDO!!!
        extraModprobeConfig = ''
          options snd-intel-dspcfg dsp_driver=1
          options snd-hda-intel model=alc256-samsung-headphone
        '';
    */
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
  };

  services.flatpak.enable = true;

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

  # Installing fonts
  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    nerd-fonts.dejavu-sans-mono
    noto-fonts-cjk-sans
  ];

  # System-wide style settings
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    image = ../wallpapers/The_Artists_Garden_at_Eragny.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal
    ];
    configPackages = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-desktop-portal
    ];
  };

  services = {
    # Enable the X11 windowing system.
    xserver.enable = true;

    # Configure keymap in X11
    xserver.xkb = {
      layout = "br";
      variant = "";
    };

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Enable SSH
    openssh.enable = true;

    # Enable Printing Drivers
    printing.enable = true;
  };

}
