{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rafaeldg";
  home.homeDirectory = "/var/home/rafaeldg";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # General Stuff
    ripgrep
    cmake
    unzip
    wget
    # Terminal
    fd
    eza
    vim
    zoxide
    bat
    tldr
    fastfetch
    # Languages
    go
    gcc
    lua
    rustup
    nodejs_22  
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Flatpaks
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "com.mattjakeman.ExtensionManager"
      "ca.desrt.dconf-editor"
      "org.chromium.Chromium"
      "cc.arduino.IDE2"
      "com.jetbrains.IntelliJ-IDEA-Community"
      "io.dbeaver.DBeaverCommunity"
      "org.libreoffice.LibreOffice"
      "de.haeckerfelix.Fragments"
      "com.parsecgaming.parsec"
      "com.discordapp.Discord"
      "com.stremio.Stremio"
    ];
  };

  # Stylix
  #stylix = {
  #  enable = true;
  #  polarity = "dark";
  #  image = ./wallpapers/tux.png;
  #  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  #  #cursor.size = 24;
  #};

  programs.bash.enable = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Allow Unfree Software
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
