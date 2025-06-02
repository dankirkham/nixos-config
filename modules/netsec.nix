{ config, lib, pkgs, ... }:
with lib; {
  options = {
    dan.netsec = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable network security packages";
      };
    };
  };

  config = mkIf config.dan.netsec.enable {
    home.packages = with pkgs; [
      kismet
    ] ++ lib.optionals config.dan.gui.enable [
      wireshark
    ];
  };
}
