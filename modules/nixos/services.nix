{
  config,
  pkgs,
  inputs,
  ...
}:

{
  services = {
    # Enable the X11 windowing system.
    xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    xserver.xkb = {
      layout = "br";
      variant = "";
    };

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Virtualization
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;

    # Enable SSH
    openssh.enable = true;

    # Enable Printing Drivers
    printing.enable = true;

    # Enable Syncthing
    syncthing.enable = true;

    # Enable Flatpak
    flatpak.enable = true;
    flatpak.packages = [
      "com.github.tchx84.Flatseal"
      "com.mattjakeman.ExtensionManager"
      "app.zen_browser.zen"
    ];
  };
}
