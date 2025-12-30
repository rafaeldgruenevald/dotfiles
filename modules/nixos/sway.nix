{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    wl-clipboard
    pavucontrol
    autotiling
    slurp
    grim
    rofi
  ];

  services.blueman.enable = true;

  networking.networkmanager.enable = true;

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  security.polkit.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };

  programs.thunar.enable = true;

  programs.foot = {
    enable = true;
    settings.main.font = "JetBrainsMono Nerd Font:size=11";
    settings.scrollback.lines = 100000;
  };
}
