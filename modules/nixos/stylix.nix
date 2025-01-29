{
  config,
  pkgs,
  inputs,
  ...
}:

{
  stylix = {
    enable = true;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    image = ../../wallpapers/gruvbox-nix.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  };
}
