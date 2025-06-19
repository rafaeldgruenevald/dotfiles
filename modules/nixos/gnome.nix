{
  config,
  pkgs,
  inputs,
  ...
}:

{
  #environment.systemPackages = with pkgs; [
  #];
  # Enable the GNOME Desktop Environment.
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
