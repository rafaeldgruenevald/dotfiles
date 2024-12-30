{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
  };
  home.file = {
    "~/.config/nushell/"= {
      source = ../config/nushell;
      recursive = true;
    };
  };
}
