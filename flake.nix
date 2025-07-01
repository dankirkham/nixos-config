{
  description = "Dan's nixos flake";

  # raspberry pi cache
  nixConfig = {
    extra-substituters = [
      "https://nixos-raspberrypi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];
  };

  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = { nixpkgs, home-manager, nixos-raspberrypi, nixgl, ... }@inputs: {
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
    nixosConfigurations.mmdvm-hotspot = nixos-raspberrypi.lib.nixosSystem {
      specialArgs = inputs;
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
    homeConfigurations.dan = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ nixgl.overlay ];
      };
      modules = [
        ./hosts/wsl/home.nix
      ];
    };
  };
}
