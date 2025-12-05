{ lib, pkgs, config, ... }:
with lib;
let
  sane-break = (pkgs.callPackage ../../overrides/sane-break.nix {});
in {
  options = {
    dan.personal = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable personal packages";
      };
    };
  };

  config = mkIf config.dan.personal.enable {
    home.packages = with pkgs; [
      yubioath-flutter
    ] ++ lib.optionals config.dan.gui.enable [
      anki-bin
      gimp
      inkscape
      libreoffice-qt
      rsibreak
      signal-desktop
      sane-break
    ];
  };
}
