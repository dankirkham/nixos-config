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
    settings = {
      user = {
        name = "Dan Kirkham";
        email = "daniel.a.kirkham@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
