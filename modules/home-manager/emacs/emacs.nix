{ config, pkgs, ... }:

{
  /*
    home.file.".config/doom/" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/rafaeldg/dotfiles/modules/home-manager/emacs/doom/";
      recursive = true;
    };
  */
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export PATH="$HOME/.emacs.d/bin:$PATH"
    '';
  };
  systemd.user.sessionVariables = {
    EDITOR = "emacs";
  };
}
