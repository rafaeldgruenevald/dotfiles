{ config, pkgs, ... }:

{
  home.file.".config/nvim/".source = config.lib.file.mkOutOfStoreSymlink "/home/rafaeldg/dotfiles/modules/home-manager/nv/nvim/";
}
