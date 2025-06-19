{ config, pkgs, ... }:

{
  home.file.".config/lan-mouse/" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/rafaeldg/dotfiles/modules/home-manager/sync/lan-mouse/";
    recursive = true;
  };
}
