{ config, pkgs, ... }:

{
  imports = [
    ../.././modules/home-manager/ghostty/ghostty.nix
    ../.././modules/home-manager/sw/sway.nix
    ../.././modules/home-manager/ro/rofi.nix
    ../.././modules/home-manager/nv/nvim.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rafaeldg";
  home.homeDirectory = "/home/rafaeldg";

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
  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };

  programs.git = {
    enable = true;
    userName = "rafaeldgruenevald";
    userEmail = "rafaeldgruenevald@proton.me";
  };

  # Set Icon Theme
  stylix.iconTheme = {
    enable = true;
    dark = "WhiteSur";
    package = pkgs.whitesur-icon-theme;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
