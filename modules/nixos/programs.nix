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
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    firefox.enable = true;
    dconf.enable = true;
    virt-manager.enable = true;
  };
}
