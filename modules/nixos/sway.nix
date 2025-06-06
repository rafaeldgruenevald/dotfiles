{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    grim
    mako
    slurp
    nautilus
    autotiling
    pavucontrol
    rofi-wayland
    wl-clipboard
  ];

  services.blueman.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${config.services.xserver.displayManager.sessionData.desktops}/share/xsessions:${config.services.xserver.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session";
        user = "greeter";
      };
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "nu";
        font = "JetBrainsMono Nerd Font:size=11";
      };
      scrollback = {
        lines = 100000;
      };
    };
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
