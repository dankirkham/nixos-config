{ pkgs, lib, config, ... }:
with lib; {
  options = {
    dan.radio = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable radio packages";
      };
    };
  };

  config = mkIf config.dan.radio.enable {
    home.packages = with pkgs; [
      chirp
      direwolf
      dsdcc
      xastir
      libiio
    ] ++ lib.optionals config.dan.gui.enable [
      fldigi
      gnuradio
      gpredict-unstable
      gqrx
      gridtracker
      inspectrum
      qdmr
      qsstv
      sdrangel
      sdrpp
      urh
      wsjtx
      xnec2c
    ];
  };
}
