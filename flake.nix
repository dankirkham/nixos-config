{
  description = "Dan's nixos flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.thinkpad-x280 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
        modules = [
          ./hosts/thinkpad-x280/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dan = ./home;
          }
        ];
    };
    nixosConfigurations.ai-7600k-gtx1080 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
        modules = [
          ./hosts/ai-7600k-gtx1080/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dan = ./home;
          }
        ];
    };
  };
}
