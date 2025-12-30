{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 5";
      flake = "/home/rafaeldg/dotfiles";
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
    dconf.enable = true;
  };
}
