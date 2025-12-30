{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # General Stuff
    ripgrep
    cmake
    unzip
    wget
    btop
    fzf

    # Dev Tools
    anydesk
    chromium
    firefox
    jetbrains.idea-oss
    #jetbrains.rust-rover
    #jetbrains.webstorm
    #jetbrains.clion
    arduino-ide

    # Terminal
    fd
    vim
    eza
    bat
    tldr
    zoxide
    fastfetch

    # LSP & Formatters
    nixd
    nixfmt-rfc-style
    lua-language-server
    stylua
    typescript-language-server
    prettierd
    ccls

    # Languages
    go
    gcc
    lua
    rustup
    dotnet-sdk_9
    nodejs_22
    typescript
    python312
    (jdk.override { enableJavaFX = true; })
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_9}/share/dotnet";
  };

  # Required for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nixpkgs.config.permittedInsecurePackages = [
    "libxml2-2.13.8"
    #"qtwebengine-5.15.19"
  ];
}
