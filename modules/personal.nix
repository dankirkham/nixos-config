{ pkgs, config, ... }:
{
  config = {
    home.packages = with pkgs; [
      yubioath-flutter
      # obsidian
      libreoffice-qt
      inkscape
      gimp
    ];
  };
}
