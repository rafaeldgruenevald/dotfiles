{ config, pkgs, inputs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gnome.enable = true;
}
