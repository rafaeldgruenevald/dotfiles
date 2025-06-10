{ config, pkgs, ... }:

{
  home.file.".config/doom/" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/rafaeldg/dotfiles/modules/home-manager/emacs/doom/";
    recursive = true;
  };
  systemd.user.sessionVariables = {
    EDITOR = "emacs";
  };
}
