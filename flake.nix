{
  description = "Dan's nixos flake";
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.thinkpad-x280 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/thinkpad-x280/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dan = ./hosts/thinkpad-x280/home.nix;
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
          home-manager.users.dan = ./hosts/ai-7600k-gtx1080/home.nix;
        }
      ];
    };
    nixosConfigurations.mmdvm-hotspot = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./hosts/mmdvm-hotspot/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dan = ./hosts/mmdvm-hotspot/home.nix;
        }
      ];
    };
  };
}
