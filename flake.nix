{
  description = "tomoe nix config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, devshell, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ devshell.overlays.default ];
        config.allowUnfree = true;
      };
    in {
    nixosConfigurations.spike = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/spike/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.tomoe = import ./hosts/spike/home.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };

    templates = {
      go = {
        path = ./templates/go;
        description = "Go project template";
      };
      python = {
        path = ./templates/python;
        description = "Python project template";
      };
      rust = {
        path = ./templates/rust;
        description = "Rust project template";
      };
      web = {
        path = ./templates/web;
        description = "Web project template";
      };
    };

    devShells.${system}.default = pkgs.devshell.mkShell {
      packages = with pkgs; [
        nil
        nixd
        nixpkgs-fmt
        statix
        deadnix
        nix-tree
        shfmt
        shellcheck
      ];
    };
  };
}
