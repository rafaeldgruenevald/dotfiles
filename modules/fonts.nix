{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    ubuntu_font_family
  ];
  fonts.fontconfig.enable = true;
}
