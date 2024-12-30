{ config, pkgs, ghostty, ... }:

{
  home.packages = [
    ghostty.packages."${pkgs.system}".default
  ];

  home.file = [
    "~/.config/ghostty/".source = ../config/ghostty;
  ];
}
