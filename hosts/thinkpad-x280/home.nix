{ config, lib, ... }:
{
  imports = [
    ../../modules/home-manager
  ];

  dan = {
    coding.enable = true;
    firefox.enable = true;
    gui.enable = true;
    media.enable = true;
    netsec.enable = true;
    personal.enable = true;
    radio.enable = true;
    games.enable = true;
  };
}
