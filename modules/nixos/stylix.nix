{
  config,
  pkgs,
  inputs,
  ...
}:

{
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    image = ../../wallpapers/The_Artists_Garden_at_Eragny.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  };
}
