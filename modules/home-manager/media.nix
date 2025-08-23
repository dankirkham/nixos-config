{ config, pkgs, lib, ... }:
with lib; {
  options = {
    dan.media = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable media packages";
      };
    };
  };

  config = mkIf config.dan.media.enable {
    home.packages = with pkgs; [
      ncspot
    ];
  };
}
