{
  description = "Home Manager configuration of rafaeldg";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { nixpkgs, home-manager, nix-flatpak, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."rafaeldg" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ./modules/fonts.nix ./modules/gtk.nix ./modules/gnome.nix ./modules/emacs.nix ./modules/nushell.nix ./modules/alacritty.nix nix-flatpak.homeManagerModules.nix-flatpak  ];

        #extraSpecialArgs = { inherit ; };
        # to pass through arguments to home.nix
      };
    };
}
