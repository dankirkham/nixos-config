{ config, lib, ... }:
{
  imports = [
    ../../modules
  ];

  dan = {
    coding.enable = true;
    gui.enable = true;
    media.enable = true;
    netsec.enable = true;
    personal.enable = true;
    radio.enable = true;
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
