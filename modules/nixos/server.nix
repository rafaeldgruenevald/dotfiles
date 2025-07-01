{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    alpaca
    (calibre.override {
      unrarSupport = true;
    })
  ];
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };
  services.udisks2.enable = true;
}
