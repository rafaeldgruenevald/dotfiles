{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Enable the GNOME Desktop Environment.
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  environment.systemPackages = with pkgs; [
    komikku
    foliate
    addwater
    fragments
    pavucontrol
  ];
}
