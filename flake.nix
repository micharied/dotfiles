{
  description = "macOS nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ag-starter = {
      url = "github:active-group/nix-starter-kit";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ nixpkgs, home-manager, ag-starter, nix-darwin, mac-app-util, ... }: {
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
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.micha = import ./home.nix;
          home-manager.backupFileExtension = ".backup";
        })
      ];
    };
  };
}
