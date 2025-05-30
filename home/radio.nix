{ pkgs, lib, ... }:
with lib; {
  # options = {
  #   dan.radio = {
  #     enable = mkOption {
  #       type = types.bool;
  #       default = false;
  #       description = "Enable radio packages";
  #     };
  #   };
  # };

  # config = mkIf config.dan.radio.enable {
  config = {
    home.packages = with pkgs; [
      chirp
      direwolf
      dsdcc
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
      wsjtx
      xastir
      xnec2c
    ];
  };
}
