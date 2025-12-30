{
  config,
  pkgs,
  inputs,
  ...
}:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  programs.virt-manager.enable = true;
}
