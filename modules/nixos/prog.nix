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
    wl-clipboard
    ripgrep
    cmake
    unzip
    wget
    fzf

    # Dev Tools
    bottles
    chromium
    arduino-ide
    dbeaver-bin
    jetbrains.idea-community
    jetbrains.rust-rover
    jetbrains.webstorm
    jetbrains.clion

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
    zig
    gcc
    lua
    rustup
    octaveFull
    nodejs_22
  ];
  # Required for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
