{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  home = {
    username = "dan";
    homeDirectory = "/home/dan";
    stateVersion = "25.05";
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Dan Kirkham";
    userEmail = "daniel.a.kirkham@gmail.com";
  };
}
