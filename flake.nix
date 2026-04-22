{
  description = "macOS nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = { nixpkgs, home-manager, nix-darwin, mac-app-util, ... }: {
    darwinConfigurations.MacBook-Air-von-Micha = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./darwin-configuration.nix
        mac-app-util.darwinModules.default

        home-manager.darwinModules.home-manager
        ({ pkgs, ... }: {
          home-manager.sharedModules = [ mac-app-util.homeManagerModules.default ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.micha = import ./home.nix;
        })
      ];
    };
  };
}
