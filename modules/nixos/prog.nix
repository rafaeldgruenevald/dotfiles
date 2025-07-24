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
    ranger
    cmake
    unzip
    wget
    btop
    fzf

    # Dev Tools
    chromium
    librewolf
    ciscoPacketTracer8
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
    nodejs_22
    octaveFull
    typescript
    python3Full
    (jdk.override { enableJavaFX = true; })
  ];

  # Required for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
