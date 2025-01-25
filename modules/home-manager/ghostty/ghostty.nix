{ config, pkgs, ... }:

{
  home.file.".config/ghostty/config".source = config.lib.file.mkOutOfStoreSymlink "/home/rafaeldg/dotfiles/modules/home-manager/ghostty/config";
}
