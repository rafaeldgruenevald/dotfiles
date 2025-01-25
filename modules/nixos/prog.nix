{ config, pkgs, inputs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # General Stuff
    ripgrep
    cmake
    unzip
    wget

    # Dev Tools
    neovim
    chromium
    arduino-ide
    dbeaver-bin
    jetbrains.idea-community

    # Terminal
    fd
    vim
    eza
    bat
    tldr
    zoxide
    nushell
    fastfetch
    inputs.ghostty.packages.x86_64-linux.default

    # Languages
    go
    zig
    gcc
    lua
    rustup
    nodejs_22
  ];
}
