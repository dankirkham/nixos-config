{ pkgs, lib, ... }:
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
  config = {
    home.packages = with pkgs; [
      ncspot
    ];
  };
}
