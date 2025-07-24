{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    nerd-fonts.dejavu-sans-mono
    noto-fonts-cjk-sans
  ];
}
