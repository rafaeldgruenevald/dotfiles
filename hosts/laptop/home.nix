{
  config,
  pkgs,
  lib,
  tags,
  inputs,
  ...
}:

{
  imports = [
    ../.././modules/home-manager/emacs/emacs.nix
    ../.././modules/home-manager/sw/sway.nix
  ]
  ++ lib.optionals (builtins.elem "full" tags) [
    ../.././modules/home-manager/gdm/gnome.nix
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

  programs.git = {
    enable = true;
    settings = {
      user.name = "rafaeldgruenevald";
      user.email = "rafaeldgruenevald@proton.me";
    };
  };
  /*
    programs.lan-mouse = {
      enable = true;
      systemd = true;
    };
  */

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [ avrdude ]);
  };

  # Set Icon Theme
  stylix.iconTheme = {
    enable = true;
    dark = "WhiteSur";
    package = pkgs.whitesur-icon-theme;
  };

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
