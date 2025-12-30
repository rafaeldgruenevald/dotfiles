{ config, pkgs, ... }:

{
  /*
    nixpkgs.overlays = [
      (import (
        builtins.fetchTarball {
          url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
          sha256 = "sha256:0swj09pcbi8i2lc54c8cm272v1hsaw7pvkbgbnprqz56jr7l14vw";
        }
      ))
    ];
  */
  environment.systemPackages = with pkgs; [
    # required dependencies
    git
    emacs
    #emacs-git
    ripgrep

    # optional dependencies
    coreutils
    fd
    clang

    # doom emacs dependencies
    # :term vterm
    libtool
    gnumake
    # :lang rust
    rust-analyzer
    # :lang cc
    clang-tools
    # :lang csharp
    csharpier
    # :lang sh
    shellcheck
    shfmt
    # :lang web
    html-tidy
    stylelint
    jsbeautifier
    # :lang data
    libxml2
  ];
}
