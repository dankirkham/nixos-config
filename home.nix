{ config, pkgs, ... }:
{
  imports = [
    ./modules/cli.nix
    ./modules/coding.nix
    ./modules/dotfiles.nix
    ./modules/firefox.nix
    ./modules/media.nix
    ./modules/netsec.nix
    ./modules/personal.nix
    ./modules/radio.nix
  ];

  home.username = "dan";
  home.homeDirectory = "/home/dan";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Dan Kirkham";
    userEmail = "daniel.a.kirkham@gmail.com";
  };
  
}
