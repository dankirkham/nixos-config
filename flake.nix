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
    agenix.url = "github:ryantm/agenix";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = inputs@{
   nixpkgs,
   home-manager,
   nixos-raspberrypi,
   nixgl,
   agenix,
   ...
 }:
  let
    hosts = [
      { name = "ai-7600k-gtx1080"; pkgs = nixpkgs; system = "x86_64-linux"; }
      { name = "mmdvm-hotspot"; pkgs = nixos-raspberrypi; }
      { name = "thinkpad-x280"; pkgs = nixpkgs; system = "x86_64-linux"; }
    ];
    configuration = host: {
      name = host.name;
      value = host.pkgs.lib.nixosSystem {
        system = host.system || null;
        specialArgs = inputs;
        modules = [
          ./hosts/${host.name}/configuration.nix
          agenix.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dan = ./hosts/${host.name}/home.nix;
          }
        ];
      };
    };
    configurations = builtins.listToAttrs (map configuration hosts);

  in {
    nixosConfigurations = configurations;
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
