{ config, pkgs, ... }:

{
  home.file.".config/sway".source = config.lib.file.mkOutOfStoreSymlink "/home/rafaeldg/dotfiles/modules/home-manager/sw/sway/";
}
