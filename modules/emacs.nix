{ config, pkgs, ... }:

let
  emacs = with pkgs; (emacsPackagesFor
    (emacs-pgtk).emacsWithPackages (epkgs: with epkgs; [
      treesit-grammars.with-all-grammars
      vterm
      mu4e
    ]);
in {
  home.packages = with pkgs; [
    # Emacs itself
    binutils
    emacs

    # Doom dependencies
    git
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
    (aspellWithDicts (ds: with ds; [ en en-computers en-science ]))
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
  ];
  home.sessionVariables = {
    PATH = [ "$XDG_CONFIG_HOME/emacs/bin" ];
  };
}