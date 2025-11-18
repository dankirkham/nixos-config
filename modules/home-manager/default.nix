{ lib, ... }:
with lib; {
  options = {
    dan.gui = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable gui packages";
      };
    };
  };

  imports = [
    ./cli.nix
    ./coding.nix
    ./firefox.nix
    ./games
    ./media.nix
    ./netsec.nix
    ./personal.nix
    ./radio.nix
    ./user.nix
  ];
}
