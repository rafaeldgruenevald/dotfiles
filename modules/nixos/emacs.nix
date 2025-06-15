{ config, pkgs, ... }:

{
  services.emacs = {
    enable = true;
    package =
      with pkgs;
      (emacsPackagesFor emacs-gtk).emacsWithPackages (
        epkgs: with epkgs; [
          treesit-grammars.with-all-grammars
          vterm
          pdf-tools
          mu4e
        ]
      );
  };
  environment.systemPackages = with pkgs; [
    # Emacs itself
    binutils
    emacs

    # Doom dependencies
    git
    gnumake
    libtool
    ripgrep
    gnutls

    # Optional dependencies
    fd
    imagemagick
    zstd

    # Module dependencies
    # :email mu4e
    mu
    isync
    # :checkers spell
    (aspellWithDicts (
      ds: with ds; [
        en
        en-computers
        en-science
      ]
    ))
    # :tools editorconfig
    editorconfig-core-c
    # :tools lookup & :lang org +roam
    sqlite
    # :lang cc
    clang-tools
    # :lang latex & :lang org (latex previews)
    texlive.combined.scheme-medium
    # :lang beancount
    beancount
    fava
    # :lang nix
    age
    # :lang sh
    shellcheck
  ];
}
