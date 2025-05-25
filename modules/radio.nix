{ pkgs, config, ... }:
{
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
