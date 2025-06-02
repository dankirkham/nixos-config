{
  description = "Dan's nixos flake";
  # nixConfig = {
  #   extra-substituters = [
  #     "https://nixos-raspberrypi.cachix.org"
  #   ];
  #   extra-trusted-public-keys = [
  #     "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
  #   ];
  # };
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    # nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi";
  };

  outputs = { nixpkgs, home-manager, nixos-raspberrypi, ... }@inputs: {
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
    # nixosConfigurations.mmdvm-hotspot = nixos-raspberrypi.lib.nixosSystemInstaller {
    #   specialArgs = inputs;
    #   system = "aarch64-linux";
    #   modules = [
    #     {
    #       imports = with nixos-raspberrypi.nixosModules; [
    #         raspberry-pi-5.base
    #       ];
    #     }

    #     ({ config, ... }: {
    #       system.nixos.tags = let
    #         cfg = config.boot.loader.raspberryPi;
    #       in [
    #         "raspberry-pi-${cfg.variant}"
    #         cfg.bootloader
    #         config.boot.kernelPackages.kernel.version
    #       ];
    #     })

    #     ./hosts/mmdvm-hotspot/configuration.nix
    #     home-manager.nixosModules.home-manager
    #     {
    #       home-manager.useGlobalPkgs = true;
    #       home-manager.useUserPackages = true;
    #       home-manager.users.dan = ./hosts/mmdvm-hotspot/home.nix;
    #     }
    #   ];
    # };
  };
}
