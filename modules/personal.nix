{ lib, pkgs, config, ... }:
with lib; {
  options = {
    dan.personal = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable personal packages";
      };
    };
  };

  config = {
    home.packages = with pkgs; [
      yubioath-flutter
    ] ++ lib.optionals config.dan.gui.enable [
      anki-bin
      libreoffice-qt
      inkscape
      gimp
    ];
  };
}
