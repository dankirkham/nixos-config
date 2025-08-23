{ pkgs, ... }:
{
  imports = [
    ../../modules/home-manager
  ];

  home.packages = with pkgs; [
    nixgl.auto.nixGLDefault
  ];

  dan = {
    coding.enable = true;
    firefox.enable = true;
    gui.enable = true;
    media.enable = false;
    netsec.enable = false;
    personal.enable = true;
    radio.enable = false;
  };
}
