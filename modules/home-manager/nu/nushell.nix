{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.nushell = {
    enable = true;
  };
  home.file = {
    ".config/nushell/" = {
      source = ./config.nu;
      recursive = true;
    };
  };
}
