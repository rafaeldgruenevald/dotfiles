{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
  };
  home.file = {
    "~/.config/nushell/config.nu".source = ../config/config.nu;
  };
}
