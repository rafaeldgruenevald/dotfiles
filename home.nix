{ config, pkgs, ghostty, ... }:

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
    pkgs.ripgrep
    pkgs.cmake
    pkgs.unzip
    pkgs.wget
    # Terminal
    ghostty.packages."${pkgs.system}".default
    pkgs.fd
    pkgs.vim
    pkgs.bat
    pkgs.zoxide
    pkgs.tldr
    pkgs.fastfetch
    # Languages
    pkgs.go
    pkgs.zig
    pkgs.gcc
    pkgs.lua
    pkgs.rustup
    pkgs.nodejs_22  
  ];
  

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    "~/.config/ghostty" = {
      source = ./config/ghostty;
      recursive = true;
    };
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

  programs.bash.enable = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Allow Unfree Software
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
