{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ubuntu_font_family
  ];
  fonts.fontconfig.enable = true;
}
