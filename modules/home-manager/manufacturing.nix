{ lib, pkgs, config, ... }:
with lib;
{
  options = {
    dan.manufacturing = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable packages for manufacturing";
      };
    };
  };

  config = mkIf config.dan.manufacturing.enable {
    home.packages = with pkgs; [
    ] ++ lib.optionals config.dan.gui.enable [
      freecad
    ];
  };
}
