{ config, lib, ... }:
{
  imports = [
    ../../modules
  ];

  home.username = "dan";
  home.homeDirectory = "/home/dan";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Dan Kirkham";
    userEmail = lib.strings.trim (builtins.readFile "/run/agenix/email");
  };

  dan = {
    coding.enable = true;
    gui.enable = true;
    media.enable = true;
    netsec.enable = true;
    personal.enable = true;
    radio.enable = true;
  };
}
