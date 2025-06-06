{ config, pkgs, ... }:

{
  home.file.".config/rofi/".source =
    config.lib.file.mkOutOfStoreSymlink "/home/rafaeldg/dotfiles/modules/home-manager/ro/rofi/";
}
