{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = "nu";
      window.padding = {
        x = 10;
        y = 10;
      };
      font.normal.family = "JetBrainsMono Nerd Font Mono";
    };
  };
}
