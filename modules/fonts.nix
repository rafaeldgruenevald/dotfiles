{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    ubuntu_font_family
  ];
  fonts.fontconfig.enable = true;
}
