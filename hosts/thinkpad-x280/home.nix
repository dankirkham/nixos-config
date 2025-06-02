{ ... }:
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
    userEmail = "daniel.a.kirkham@gmail.com";
  };

  dan = {
    radio.enable = false;
  };
}
