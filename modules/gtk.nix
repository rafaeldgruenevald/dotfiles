{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur-icon-theme";
      package = pkgs.whitesur-icon-theme;
    };
  };
}
