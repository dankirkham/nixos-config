{ lib, pkgs, config, ... }:
with lib;
let
  mkDosGame = pkgs.callPackage ./mkDosGame.nix {};
  fetch7z = pkgs.callPackage ./fetch7z.nix {};
  battlehawks1942 = pkgs.callPackage ./battlehawks1942.nix { inherit mkDosGame; };
  their-finest-hour = pkgs.callPackage ./their-finest-hour.nix { inherit mkDosGame fetch7z; };
  swotl = pkgs.callPackage ./swotl.nix { inherit mkDosGame fetch7z; };
in
{
  options = {
    dan.games = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable games";
      };
    };
  };

  config = mkIf config.dan.personal.enable {
    home.packages = [
    ] ++ lib.optionals config.dan.gui.enable [
      battlehawks1942
      their-finest-hour
      swotl
    ];
  };
}
