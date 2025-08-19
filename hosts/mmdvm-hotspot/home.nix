{ lib, ... }:
{
  imports = [
    ../../modules
  ];

  dan = {
    coding.enable = true;
    gui.enable = false;
    media.enable = false;
    netsec.enable = false;
    personal.enable = false;
    radio.enable = false;
  };

  programs.home-manager.enable = true;

  home.username = "dan";
  home.homeDirectory = "/home/dan";
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Dan Kirkham";
    userEmail = "daniel.a.kirkham@gmail.com";
  };
}
