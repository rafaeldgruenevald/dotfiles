{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  environment.systemPackages = with pkgs; [
    fragments
    pavucontrol
  ];
}
