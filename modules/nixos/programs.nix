{ config, pkgs, inputs, ... }:

{
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 5";
      flake = "/home/rafaeldg/dotfiles";
    };
    firefox.enable = true;
    dconf.enable = true;
    virt-manager.enable = true;
  };
}
