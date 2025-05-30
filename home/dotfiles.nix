{ config, ... }:
let
  home = config.home.homeDirectory;
  configPath = "${home}/.config";
  dotfilesPath = "/etc/nixos/dotfiles";
  programs = [ "nvim" "wezterm" ];
in {
  systemd.user.tmpfiles.rules =
    map (cfg: "L+ ${configPath}/${cfg} - - - - ${dotfilesPath}/${cfg}")
    programs;
}


